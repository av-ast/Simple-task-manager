YaAcl::Builder.build do
  roles do
    role :admin
    role :editor
    role :operator
  end

  asserts do
    assert :assert_name, [:current_user_id, :another_user_id] do
      current_user_id == another_user_id
    end

    assert :another_assert_name, [:current_user_id, :another_user_id] do
      current_user_id != another_user_id
    end
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
    resource 'comments', [:editor, :operator] do
    end
  end
end
