class ScansController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  
  def index
    @campaigns = current_user.campaigns

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @campaigns }
    end
  end
  
  def new
    @scan = Scan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scan }
    end
  end
  
  def create
    @params = params
    
    #TODO: check if email exists for current campaign
      #if yes, increment counter and send email for already scanned
      #if no, create scan and send email for new scan
      
    @scan = Scan.new( 
              #TODO: get email and body from params and strip out extra characters
              :email => "earlynovrock@gmail.com",
              :campaign_id => Scan.get_campaign(4),
              :code => rand(1000000)
              )
              
    respond_to do |format|
      if @scan.save && request.post?
        #send email to customer
        
        format.html { redirect_to(scans_url, :notice => 'Scan was successfully created.') }
        format.xml { render :xml => @scan, :status => :created }
      else
        flash[:notice] = "Error"
        format.xml { render :xml => @scan.errors, :status => :unprocessable_entity }
      end
    end  
  end

  
end
