module ActiveRecord
  module SortBy

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      # Default sort_by
      def sort_by(field='id', direction='asc', options = {}, &block)
        field ||= 'id'
        direction ||= 'asc'
        
        valid_association = true
        # field "equipes.model.model2.field"
        
        associated_models = field.split('.')
        f = associated_models.pop # field of the associated model
        associated_models.map! { |r| r.singularize } # convert strings to symbols
        
        r = self
        for model in associated_models do # loop associations to find the final model
          if r.reflections.has_key? model.to_sym
            r = r.reflections[model.to_sym].klass
          elsif r.reflections.has_key? model.pluralize.to_sym
            r = r.reflections[model.pluralize.to_sym].klass
          else
            valid_association = false
            break
          end
        end
        
        if valid_association
          valid_association = r.column_names.include? f
        end
        
        raise InvalidField, "the field you provided is not a field in this table. #{r}, #{f}" unless valid_association
        raise InvalidDirection, "the direction you provided is not a valid direction" if !["asc", "desc"].include?(direction.downcase)
        
        default_options = { :order => "#{field} #{direction}" }
    
        if block_given?
          with_scope(:find => options.merge(default_options)) do
            block.call
          end
        else
          all(options.merge(default_options))
        end
      end
  
      # For interaction with will_paginate
      def paginated_sort_by(field='id', direction='asc', pagination_options = {}, options={})
        pagination_options[:page] = 1 if pagination_options[:page].nil? || pagination_options[:page].to_i < 1
        sort_by(field, direction, options) do
          paginate(pagination_options)
        end
      end
    end


    class InvalidField < Exception; end
    class InvalidDirection < Exception; end
  end
end