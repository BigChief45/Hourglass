class RecordPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = punchcard
  end

  def index?
    user.admin? or record.punchcard.user == user
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