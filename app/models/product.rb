class Product < ActiveRecord::Base
  belongs_to :brand
  has_many :users, through: :orders
  has_many :comments
  has_many :prod_images
  has_many :orders

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::Csv.new(file.path, exention: 'csv')
      when '.xls' then Roo::Excel.new(file.path, exention: 'xls')
      when '.xlsx' then Roo::Excelx.new(file.path, exention: 'xlsx')
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

def self.import(file)
  spreadsheet = Roo::Excelx.new((file).path)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    product = find_by_id(row["id"]) || new
    product.id = spreadsheet.cell(i, 'A')
    product.brand_id = spreadsheet.cell(i, 'B')
    product.artcode = spreadsheet.cell(i, 'C')
    product.quantity = spreadsheet.cell(i, 'D')
    product.price = spreadsheet.cell(i, 'E')
    product.description = spreadsheet.cell(i, 'F')
#    product.attributes = row.to_hash.slice(*accessible_attributes)
    product.save!
    end
  end
end
