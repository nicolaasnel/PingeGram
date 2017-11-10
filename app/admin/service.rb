ActiveAdmin.register Service do
  permit_params :name, :service_type

  form do |f|
    f.inputs do
      f.input :name
      f.input :service_type, collection: Service.service_types.map { |k,v| [k.humanize, k] }
    end
    f.actions
  end

end
