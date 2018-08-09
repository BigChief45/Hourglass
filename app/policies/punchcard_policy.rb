class PunchcardPolicy
  attr_reader :user, :punchcard

  def initialize(user, punchcard)
    @user = user
    @punchcard = punchcard
  end

  def index?
    user.admin? or punchcard.user == user
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    index?
  end

  def edit?
    show?
  end

  def update?
    show?
  end

  def destroy
    show?
  end

end