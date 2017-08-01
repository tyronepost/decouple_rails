require 'minitest/autorun'
require_relative '../../app/runners/create_runner'

class CreateRunnerTest < Minitest::Test
  def test_create_runner
    repo = RepoStub.new
    context = ContextSpy.new
    CreateRunner.new(context, repo).run(nil)
    assert context.create_succeeded_called?
  end 
end

class RepoStub
  def new_employee(params)
    nil
  end

  def save_employee(employee)
    true
  end
end

class ContextSpy
  def create_succeeded(employee, msg)
    @create_succeeded_called = true
  end

  def create_failed(employee)
  end

  def create_succeeded_called?
    @create_succeeded_called
  end
end