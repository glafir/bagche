class Towns < Application
  def configure(c)
    super
    c.title = "Towns"
    c.model = "Town"
    c.columns = [
      {name: :city, header: "Название eng", width: 150},
      {name: :accent_city, header: "Название eng", width: 150},
      {name: :city_rus, header: "Название Рус", width: 150},
      {name: :country, header: "Страна", width: 10},
      {name: :latitude, header: "Широта", width: 50},
      {name: :longitude, header: "Долгота", width: 50}
    ]
  end
end

