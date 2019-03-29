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
    if user.admin? || user.premium
      true
    elsif
      # Allow free users to only create 1 punchcard
      !(user.punchcards.count >= 1)
    end
  end

  def create?
    new?
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