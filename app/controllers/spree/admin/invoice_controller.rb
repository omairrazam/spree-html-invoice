module Spree
  module Admin
    class InvoiceController < Spree::BaseController
      layout false
      def show
        # template = params[:template]
        # instance_variable_set('@' + template, true)
        @order = Spree::Order.find_by(number: params[:id])
        # render template, layout: false

        respond_to do |format|
          format.html
          format.pdf do
            @pdf = render_to_string :pdf => 'invoice',:zoom => '0.78125',:template => 'spree/admin/invoice/show.html.erb', :encoding => "UTF-8"
            send_data(@pdf, :filename => 'invoice.pdf', :type=>'application/pdf')
          end
        end

      end
    end
  end
end
