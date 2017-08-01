class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = repo.find_all_employees
  end

  def show
  end

  def new
    @employee = repo.new_employee
  end

  def edit
  end

  def create
    CreateRunner.new(self, repo).run(employee_params)
  end

  def create_succeeded(employee, msg)
    respond_to do |format|
      format.html {redirect_to employee, notice: msg}
      format.json {render :show, status: :created, location: employee}
    end
  end

  def create_failed(employee)
    respond_to do |format|
      format.html {render :new}
      format.json {render json: employee.errors, status: :unprocessable_entity}
    end
  end

  def update
    respond_to do |format|
      if repo.update_employee(@employee, employee_params)
        format.html {redirect_to @employee, notice: 'Employee was successfully updated.'}
        format.json {render :show, status: :ok, location: @employee}
      else
        format.html {render :edit}
        format.json {render json: @employee.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    repo.destroy_employee(@employee)
    respond_to do |format|
      format.html {redirect_to employees_url, notice: 'Employee was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  def set_employee
    employee_id = params[:id]
    @employee = repo.find_employee(employee_id)
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name)
  end

  def repo
    @repo ||= Repository.new
  end
end
