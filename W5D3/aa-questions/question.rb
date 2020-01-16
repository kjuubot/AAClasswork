require_relative 'questions-database.rb'
require_relative 'reply.rb'


class Question 
  attr_accessor :id, :title, :body, :author_id

   def self.find_by_id(id)
    query = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
  end

  def self.find_by_author_id(author_id)
    query = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
    
  end

  def author
    query = QuestionsDatabase.instance.execute(<<-SQL, self.author_id)
      SELECT
        DISTINCT *
      FROM
        users
      WHERE
        id = ? 
    SQL
  end

  def replies
    Reply.find_by_question_id(self.id)
  end

  
end

test = Question.new({"id"=>1, "title"=>"SQL question", "body"=>"What is sql?", "author_id"=>1})

p test.replies