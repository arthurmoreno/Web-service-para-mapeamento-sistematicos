class PaginaInicialController < ApplicationController
require 'zipcode'
	def index
		
	end
	def pegar
		zip = params[:zip]
		@codigo = ZipCode.new(zip)
		@estado = @codigo.get_estado
		@cidade = @codigo.get_cidade
		@codigo_de_area = @codigo.get_codigo
		@time = @codigo.get_time
	end
end
