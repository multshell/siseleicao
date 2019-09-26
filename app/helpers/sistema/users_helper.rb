module Sistema::UsersHelper
    OptionsForRoles = Struct.new(:id, :description)
    
    def options_for_roles
        User.roles_i18n.map do |key, value|
            OptionsForRoles.new(key, value)
        end
    end
end