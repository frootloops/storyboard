Storyboard::Application.routes.draw do
  api_version module: "Api/V1", path: { value: "api/v1" } do
    resources :users
    resources :guides do
      resources :steps
    end
    resources :tokens, only: [:create] do
      collection do
        delete :destroy, to: :destroy
      end
    end
  end
end
