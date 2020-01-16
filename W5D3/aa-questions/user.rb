require_relative 'questions-database.rb'
require_relative 'question.rb'
require_relative 'reply.rb'

class User
  attr_accessor :id, :fname, :lname
  

  def self.find_by_id(id)
    query = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
  end

  def self.find_by_name(fname,lname)

    query = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(self.id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

end

# user_hash = User.find_by_id(1)
# p user = User.new({"id"=>1, "fname"=>"Andy", "lname"=>"Tran"})
# p user.authored_replies