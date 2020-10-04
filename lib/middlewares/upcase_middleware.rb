class UpcaseMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "*" * 50
    puts "#{self.class} initialize(app = #{ @app.class})"
    puts "*" * 50
    status, headers, body = @app.call(env)
    puts "*" * 50
    puts "* #{self.class} call (body = #{body})"
    puts "*" * 50
    body.each {|s| s.gsub!(/ruby/i, "RUBY")}
    [status, headers, body]
  end
end
