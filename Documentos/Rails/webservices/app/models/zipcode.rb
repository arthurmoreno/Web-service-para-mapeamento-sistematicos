class ZipCode < ActiveRecord::Base
  attr_reader :state, :city, :area_code, :time_zone

  def initialize(zip)
    # Gyoku.convert_symbols_to :camelcase
    client = Savon.client(wsdl: "http://www.webservicex.net/uszip.asmx?WSDL")
    response = client.call(:get_info_by_zip, message: { "USZip" => zip})
    if response.success?
      data = response.to_array(:get_info_by_zip_response, :get_info_by_zip_result, :new_data_set, :table).first
      if data
        @estado = data[:state]
        @cidade = data[:city]
        @codigo_de_area = data[:area_code]
        @time_zone = data[:time_zone]
      end
    end
  end

	def get_estado
		return @estado
	end
	def get_cidade
		return @cidade
	end
	def get_codigo
		return @codigo_de_area
	end
	def get_time
		return @time_zone
	end
end
