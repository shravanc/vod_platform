class ServicesController < ApplicationController

def index
  render json: {data: Service.last.as_json}, status: :ok
end

end
