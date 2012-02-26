YaAcl::Builder.build do
  roles do
    role :admin
    role :editor
    role :operator
  end

  resources :admin do 
    resource 'users' do
        privilege :index, [:editor, :operator]
        privilege :show, [:editor, :operator]
        privilege :new
        privilege :create
        privilege :edit
        privilege :update
        privilege :destroy
    end
    resource 'stories', [:editor] do
        privilege :index, [:operator]
        privilege :show, [:operator]
        privilege :new
        privilege :create
        privilege :edit
        privilege :update
        privilege :destroy
    end
    resource 'comments', [:editor] do
        privilege :create, [:operator]
        privilege :destroy, [:operator]
    end
  end
end
