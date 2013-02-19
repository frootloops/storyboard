Storyboard::Application.routes.draw do
  api_version(module: "Api/V1", path: { value: "api/v1" }) do
    post 'sessions/create' => 'sessions#create'
  end
end
