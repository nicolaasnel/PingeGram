ActiveAdmin.register Service do
  permit_params :name, :type

  show do
    attributes_table do
      row :id
      row :name
      row :type
      row :created_at
      row :updated_at
    end
  end

  index do
    column :id
    column :name
    column :type
    column :created_at
    column :updated_at
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :type, collection: Service.types.values
    end
    f.actions
  end

end
