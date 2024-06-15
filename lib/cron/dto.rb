module Cron
  class Dto
    def to_request(hash_params)
      JSON.dump({
                  Name: hash_params[:name],
                  Expression: hash_params[:expression],
                  WebhookUrl: hash_params[:webhook_url],
                  UserID: hash_params[:user_id]
                })
    end

    def from_response(json_params)
      {
        uuid: json_params['Uuid'],
        name: json_params['Name'],
        expression: json_params['Expression'],
        webhook_url: json_params['WebhookUrl'],
        user_id: json_params['UserID'],
        last_run: json_params['LastRun'],
        next_run: json_params['NextRun']
      }
    end
  end
end
