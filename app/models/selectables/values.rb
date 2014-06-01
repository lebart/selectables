module Selectables
  class Values
    def self.return_values(ids)
      if ids
        values = []
        ids.split(',').each do |id|
          values << Selectable.find(id).value
        end
        # returning a string with the value separated by commas. This is the format expected by select2
        return values.join(", ")
      else
        I18n.t("missing value from select option")
      end
    end

     def self.find_or_create(values, category)
        #we pase the values, if they exist we store their id else we create a new selectable and store the id
        #we returning the ids in a commas separated string
        selectables = values.split(',')
        array = []
        selectables.each do |v|
           new_selectable = Selectable.where(category: category, value: v).first_or_create
           array << new_selectable.id
        end
        ids = array.join(", ")
        return ids
     end

    def self.build_selectables(params)
      new_params = {}
      #we recive the params from the controller and we parse it to extrat each attributes
      #then we convert the values which are string to integer corresponding to the id of a selectable
      params.each do |attribute, value|
        new_params.merge!("#{attribute}" => Selectables::Values.find_or_create(value, "#{attribute}"))
      end

      return new_params
    end
  end
end