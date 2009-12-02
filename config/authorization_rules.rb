authorization do
  role :guest do
    has_permission_on :admin_users, :to => :manage
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read
    has_permission_on :users, :to => [:show, :create]
    has_permission_on :work_sessions, :to => :read
    has_permission_on [:equipes, :promotions, :secteurs], :to => :read
  end
  
  role :utilisateur do
    includes :guest
    has_permission_on :users, :to => :profile
    has_permission_on :users, :to => :update do
      if_attribute :id => is { user.id }
    end
    has_permission_on :work_sessions, :to => [:create, :read, :update] do
      if_attribute :user => is { user }
    end
  end
  
  role :administrateur do
    includes :utilisateur
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