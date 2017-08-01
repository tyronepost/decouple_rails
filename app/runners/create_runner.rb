class CreateRunner
  attr_reader :context, :repo

  def initialize(context, repo)
    @context = context
    @repo = repo
  end

  def run(params)
    @employee = repo.new_employee(params)
    if repo.save_employee(@employee)
      context.create_succeeded(@employee, 'Employee was successfully created.')
    else
      context.create_failed(@employee)
    end
  end
end
