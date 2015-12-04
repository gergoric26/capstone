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
##    current_vendor.vendor?
#  end

#  def new?
#    create?
#  end

#  def update?
#    current_vendor.vendor?
#  end

#  def edit?
#    update?
#  end

#  def destroy?
#    current_vendor.vendor?
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
