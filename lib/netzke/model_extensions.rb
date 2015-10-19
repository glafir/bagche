module Netzke::ModelExtensions
  class AircompanyForGridPanel < Aircompany

    # Virtual attribute defined below
    netzke_attribute :al_online_bulb

    def al_online_bulb
        getter: lambda { |r|
          bulb = r.al_online ? "on" : "off"
          "<div class='bulb-#{bulb}' />"
        }
    end
  end
end

