require 'swagger_helper'

describe 'Pets API' do

  path '/suppliers/{id}' do

    get 'Retrieves a supplier' do
      tags 'Supplier'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            supplierName: { type: :string },
            contactName: { type: :string },
            address: { type: :string },
            city:{ type: :string },
            postalCode:{ type: :string },
            country:{ type: :string },
            phone: { type: :string } 
          },
          required: [ 'supplierName', 'contactName', 'address', 'city' , 'postalCode', 'country','phone']

        let(:id) { 
            Supplier.create(supplierName: 'foo', contactName: 'bar', address: 'foo', city: 'foo', postalCode: 'ddd', country: 'foo', phone: 'dddd').id
         }
        run_test!
      end

      response '404', 'supplier not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/suppliers' do

    post 'Creates a supplier' do
      tags 'Supplier'
      consumes 'application/json', 'application/xml'
      parameter name: :supplier, in: :body, schema: {
        type: :object,
        properties: {
            supplier: {
                type: :object,
                properties: {
                    supplierName: { type: :string },
                    contactName: { type: :string },
                    address: { type: :string },
                    city:{ type: :string },
                    postalCode:{ type: :string },
                    country:{ type: :string },
                    phone: { type: :string } 
                }
            }           
        },
        required: [ 'supplierName', 'contactName', 'address', 'city' , 'postalCode', 'country','phone']
      }

      response '201', 'supplier created' do
        # let(:pet) { { name: 'Dodo', status: 'available' } }
        # run_test!
      end

      response '422', 'invalid request' do
        # let(:pet) { { name: 'foo' } }
        # run_test!
      end
    end
  end

end