require_relative "questions-database.rb"
require "byebug"

class Reply 
  attr_accessor :id, :subject_id, :parent_id, :user_id, :body

  def self.find_by_id(id)
    query = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
  end

  def self.find_by_user_id(user_id)
    query = QuestionsDatabase.instance.execute(<<-SQL,user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
  end

   def self.find_by_question_id(subject_id)
    query = QuestionsDatabase.instance.execute(<<-SQL,subject_id)
      SELECT
        *
      FROM
        replies
      WHERE
        subject_id = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @subject_id = options['subject_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def author
    query = QuestionsDatabase.instance.execute(<<-SQL, self.user_id)
      SELECT
        DISTINCT *
      FROM
        users
      WHERE
        users.id = ?
    SQL
  end

  def question
    query = QuestionsDatabase.instance.execute(<<-SQL, self.subject_id)
    SELECT
      *
    FROM
      questions
    WHERE
      questions.id = ?
    SQL
  end

  def parent_reply
    query = QuestionsDatabase.instance.execute(<<-SQL, self.parent_id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL
  end

  def child_replies
    query = QuestionsDatabase.instance.execute(<<-SQL, self.id)
      SELECT
        *
      FROM
        replies
      WHERE
        replies.parent_id = ?
    SQL
  end
end

reply = Reply.new({"id"=>1, "subject_id"=>1, "parent_id"=>nil, "user_id"=>1, "body"=>"SQL is idk"})
# p Reply.find_by_user_id(1)
p reply.child_replies