#	Copyright 2007 Amazon Technologies, Inc.  Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License. You may obtain a copy of the License at:
#
#	http://aws.amazon.com/apache2.0
#
#	This file is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#	See the License for the specific language governing permissions and limitations under the License.


require 'base64'
require 'openssl'

#	Please use ruby version 1.8.3 or later to run this sample.	
#       1. Replace the values of the constants ACCESS_KEY and SECRET_KEY with your Access Key ID and Secret Access Key
# 	2. Save this code in a file, MarketplaceWidgetUtils.rb.
#	3. Run as: ruby MarketplaceWidgetUtils.rb
#	4. You'll see a sample Marketplace Widget HTML form
#	5. You can make a call to the 'get_marketplace_widget_form' subroutine as demonstrated at the end of this file.
#	6. Change the parameters at the end of this file, to generate your own Marketplace Widget
#	7. This sample, by default, generates a widget which points to the Amazon Payments Sandbox 
#	   In order to use this widget in production:  
#	   Replace "authorize.payments-sandbox.amazon.com" with "authorize.payments.amazon.com" in the generated HTML
#


module PayNowWidgetUtils
  def get_marketplace_widget_form(access_key, aws_secret_key, form_params)
	form_params['accessKey'] = access_key
	
	# lexicographically sort the form parameters
	# and create the canonicalized string
	str_to_sign = ""
	form_params.keys.sort {|a,b| a.downcase <=> b.downcase}.each { |k| str_to_sign += "#{k}#{form_params[k]}" }

	# calculate signature of the above string
	digest = OpenSSL::Digest::Digest.new('sha1')
	hmac = OpenSSL::HMAC.digest(digest, aws_secret_key, str_to_sign)
	form_params['signature'] = Base64.encode64(hmac).chomp

	# construct the form
	signed_form =<<-STARTFORM
	<form action="https://authorize.payments-sandbox.amazon.com/pba/paypipeline"
	      method="post">
	STARTFORM

	form_params.each do |key, value|
	  next unless key and value
	  signed_form +=<<-"FORMELEM"
	    <input type="hidden" name="#{key}" value="#{value}" >
      FORMELEM
	end

	signed_form +=<<-ENDFORM
	    <input type="image"  
	           src="https://authorize.payments.amazon.com/pba/images/payNowButton.png"
               border="0" >
	</form>
    ENDFORM

    return signed_form
  end

end

include PayNowWidgetUtils
ACCESS_KEY = 'AKIAJGZPSZQUTFRKVIFQ'
SECRET_KEY = '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'
print get_marketplace_widget_form(ACCESS_KEY, SECRET_KEY, 
                              'amount' => 'USD 2.0', 
                              'description' => 'Test Widget', 
                              'referenceId' => 'txn1102', 
                              'returnUrl' => 'http://yourwebsite.com/return.html',
                              'abandonUrl' => 'http://yourwebsite.com/abandon.html',
                              'immediateReturn' => '0',
                              'processImmediate' => '1',
                              'ipnUrl' => 'http://yourwebsite.com/ipn',
			      'recipientEmail' => 'seller@mail.com',
                              'fixedMarketplaceFee' => 'USD 0.01',
                              'variableMarketplaceFee' => '4' )
