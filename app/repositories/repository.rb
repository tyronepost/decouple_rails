class Repository
  def find_all_employees
    Employee.all
  end

  def find_employee(employee_id)
    Employee.find(employee_id)
  end

  def new_employee(*args)
    Employee.new(*args)
  end

  def save_employee(employee)
    employee.save
  end

  def update_employee(employee, *args)
    employee.update(*args)
  end

  def destroy_employee(employee)
    employee.destroy
  end
end

