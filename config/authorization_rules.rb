authorization do
  role :guest do
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
    has_permission_on :users, :to => :create
    has_permission_on [:equipes, :promotions, :secteurs], :to => :read
  end
  
  role :user do
    includes :guest
    has_permission_on :work_sessions, :to => [:create, :read, :update] do
      if_attribute :user => is { user }
    end
    has_permission_on :users, :to => [:create, :read, :update] do
      if_attribute :id => is { user.id }
    end
  end
  
  role :administrateur do
    includes :user
    has_permission_on [:users, :work_sessions, :promotions, :secteurs, :equipes, :roles], :to => :manage
  end
  
end

privileges do
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end