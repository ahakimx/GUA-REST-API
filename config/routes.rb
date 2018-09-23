Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :v1 do
      #insurance_categories
      get 'insurance_categories', to: 'insurance_categories#index'
      get 'insurance_categories/:id', to: 'insurance_categories#show'
      post "insurance_categories/create", to: 'insurance_categories#create'
      put "insurance_categories/:id/update", to: "insurance_categories#update"
      delete "insurance_categories/:id/destroy", to: "insurance_categories#destroy"

      #agents
      get 'agents', to: 'agents#index'
      get 'agents/:id', to: 'agents#show'
      post "agents/create", to: 'agents#create'
      put "agents/:id/update", to: "agents#update"
      put 'agents/:id/update_avatar', to: 'agents#update_avatar'
      delete "agents/:id/destroy", to: "agents#destroy"

      #users
      get 'users', to: 'users#index'
      get 'users/:id', to: 'users#show'
      post "users/create", to: 'users#create'
      put "users/:id/update", to: "users#update"
      delete "users/:id/destroy", to: "users#destroy"
      post 'users/login', to: 'authentication_users#authenticate'

      #policies
      get 'policies', to: 'policies#index'
      get 'policies/:id', to: 'policies#show'
      post 'policies/create', to: 'policies#create'
      put 'policies/:id/update', to: 'policies#update'
      get 'policies/user/:id', to: 'policies#show_user'
      get 'policies/user/agent/:id', to: 'policies#show_user_agents'
      put 'policies/user/:id/change-agent-user', to: 'policies#change_agent_user'
      put 'policies/user/:id/change-policy-user', to: 'policies#change_policy_user'

      #admins
      get 'admins', to: 'admins#index'
      post 'admins/create', to: 'admins#create'
      put 'admins/:id/update', to: 'admins#update'
      delete 'admins/:id/destroy', to: 'admins#destroy'
      post 'admins/login', to: 'authentication_admins#authenticate'
      post 'admins/reply-comment', to: 'comment_replies#reply_comment_user'
      get 'admins/notification', to: 'admin_notifications#index'
      get 'admins/mark-as-read', to: 'admin_notifications#mark_as_read'
      get 'admins/:id', to: 'admins#show'

      #promos
      get 'promos', to: 'promos#index'
      get 'promos/:id', to: 'promos#show'
      post 'promos/create', to: 'promos#create'
      put 'promos/:id/update', to: 'promos#update'
      delete 'promos/:id/destroy',to: 'promos#destroy'


      #subject_comments
      get 'subject-comments', to: 'subject_comments#index'
      get 'subject-comments/:id', to: 'subject_comments#show'
      post 'subject-comments/create', to: 'subject_comments#create'
      put 'subject-comments/:id/update', to: 'subject_comments#update'
      delete 'subject-comments/:id/destroy', to: 'subject_comments#destroy'

      #comment_replies
      get 'comment-replies', to: 'comment_replies#index'
      get 'comment-replies/:id', to: 'comment_replies#show'
      delete 'comment-replies/:id/destroy', to: 'comment_replies#destroy'

      #comments
      get 'comments', to: 'comments#index'
      get 'comments/:id', to: 'comments#show_comment_and_replies'


    end

    namespace :v1 do
      namespace :user do

        #users
        get '/notification', to: 'user_notifications#index'
        get 'users/mark-as-read', to: 'user_notifications#mark_as_read'
        post '/update-password', to: 'users#update_password'
        put "/request_forget_password", to: "users#request_forget_password"
        post '/reply-comment', to: 'users#reply_comment'
        put '/update-fcm-token', to: 'users#update_fcm_token'
        get '/push-notifs', to: 'push_notifications#send_push'
        get '/detail/:id', to: 'users#show'

        #comments
        get 'comments', to: 'comments#index'
        get 'comments/:id', to: 'comments#show'
        get 'comments/:id/replies', to: 'comments#show_comment_and_replies'
        post 'comments/create', to: 'comments#create'
        delete 'comments/:id/destroy', to: 'comments#destroy'

        #request_change
        get 'request-changes', to: 'request_changes#index'
        post 'request-changes/create', to: 'request_changes#create'

        #agent
        get 'agents', to: 'agents#all_agents_user'
        get 'agents/:id', to: 'agents#show'

        #policies
        get 'my-policies', to: 'policies#my_policies'

      end
    end

    namespace :v1 do
      namespace :public do
        #promo
        get 'promos', to: 'promos#index'
        get 'promos/:id', to: 'promos#show'

        #subject comment
        get 'subject-comments', to: 'subject_comments#index'
      end
    end
end
