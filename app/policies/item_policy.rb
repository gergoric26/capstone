class ItemPolicy
  attr_reader :current_vendor, :item

  def initialize(current_vendor, item)
    @current_vendor = current_vendor
    @item = item
  end

#  def index?
#    false
#  end

#  def create?
#    false
#  end

#  def new?
#    create?
#  end

#  def update?
#    false
#  end

#  def edit?
    
#  end

#  def destroy?
#    false
#  end

#  def scope
#    Pundit.policy_scope!(user, record.class)
#  end

#  class Scope
#    attr_reader :user, :scope

#    def initialize(user, scope)
#      @user = user
#      @scope = scope
#    end

#    def resolve
#      scope
#    end
#  end
end
