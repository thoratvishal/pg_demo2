class RtosController < ApplicationController
  def index
    respond_to do |format|
      format.html {
        result = Rto::Operation::Index.(params: params, current_user: current_user)
        render cell(Rto::Cell::Index, result[:model])
      }
      format.json {render json: DataTables::RtoList.new(current_user, params)}
    end
  end

  def new
    run Rto::Operation::Create::Present do |result|
      render cell(Rto::Cell::New, @form)
    end
  end

  def create
    run Rto::Operation::Create, current_user: current_user do |result|
      return redirect_to rtos_path
    end
    return render cell(Rto::Cell::New, @form)
  end

  def show
    run Rto::Operation::Show
    if result.success?
      render cell(Rto::Cell::Show, result['model'])
    else
      redirect_to rtos_path
    end
  end

  def edit
    run Rto::Operation::Update::Present do |result|
      render cell(Rto::Cell::Edit, @form)
    end
  end

  def update
    run Rto::Operation::Update do |result|
      return redirect_to rtos_path
    end
    render cell(Rto::Cell::Edit, @form)
  end

  def destroy
    run Rto::Operation::Delete
    redirect_to rtos_path
  end
end
