class VehiclesController < ApplicationController
    before_action :fetch_vehicle, only: [:show, :edit, :update, :destroy]
    #antes de que se inicia função, utilizo fetch_vehicle nas determinadas funções
    def index
        #Vehicle.all eu busco na camada de models
        #salvo o valor no control
        @arrayDeInstanciasVehicles = Vehicle.all.order(created_at: :asc)
                                            #where                                  
    end
    def new
        @vehicle = Vehicle.new
    end
    def create
        @vehicle = Vehicle.new(vehicle_params)
        #puts "Parâmetros do formulário: #{params[:vehicle]}" # Isso exibirá os parâmetros no console
        
        # Código de redirecionamento ou renderização em caso de sucesso
        # redireciona o path do show
        @vehicle.save ? (redirect_to vehicle_path(@vehicle)) : (render :new)
        #renderiza o formulário dnv
    end
    def show
        #para conseguir pegar os parametros do vehicle 
    end
    def edit
        #para conseguir pegar os parametros do vehicle 
    end
    def update
        # Carrega o veículo existente com base no ID fornecido nos parâmetros da URL
        # Tenta atualizar o veículo com os parâmetros fornecidos no formulário
        return redirect_to vehicle_path(@vehicle) if @vehicle.update(vehicle_params) # guard close
        # Se a atualização for bem-sucedida, redireciona para a página de exibição do veículo atualizado
        # Se houver falhas na validação ou no salvamento, renderiza novamente a página de edição para correção
        render :edit
    end

    def destroy
        if @vehicle.destroy
            redirect_to vehicle_path(@vehicle)
        end
    end
    def fetch_vehicle
        @vehicle = Vehicle.find(params[:id])
    end
    #Função para tratar os parametros na criação de veiculo
    private
    def vehicle_params
        params.require(:vehicle).permit(:brand, :model, :year, :plate, :kind)
        # ste método privado usa a técnica de Strong Parameters. Ele garante que apenas os parâmetros específicos (atributos do modelo Vehicle) sejam permitidos no método create.
        # params.require(:vehicle).permit(:brand, :model, :year, :plate, :kind): Indica que os parâmetros do formulário devem ser aninhados sob a chave :vehicle, e apenas os campos especificados são permitidos.
    end
end