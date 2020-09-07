class Schedules < BaseV1
  resource :schedules do
    desc "Return all schedules"
    get "/" do
      Schedule.all
    end

    desc "Return a schedule"
    params do
      requires :id, type: String, desc: "ID of the schedule"
    end
    get ":id" do
      Schedule.where(id: params[:schedule_id]).first
    end
  end
end
