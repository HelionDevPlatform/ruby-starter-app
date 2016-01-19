require 'json'

class HomesController < ApplicationController
  layout :get_layout

  def index

  end

  def vcap_services
    @vcap_services = nil
    @vcap_services = ENV['VCAP_SERVICES'] if ENV['VCAP_SERVICES'].present?
    render json: @vcap_services
  end

  def vcap_application
    @vcap_application = nil
    @vcap_application = ENV['VCAP_APPLICATION'] if ENV['VCAP_APPLICATION'].present?
    render json: @vcap_application
  end

  def vcap_links
    @vcap_links = {}
    @vcap_links[:USER_SERVICE] = ENV['USER_SERVICE'] if ENV['USER_SERVICE'].present?
    @vcap_links[:CF_MGMT_TOOL] = ENV['CF_MGMT_TOOL'] if ENV['CF_MGMT_TOOL'].present?
    render json: @vcap_links
  end

  def services

  end

  private
  def get_layout
    if action_name == "services"
      return "services"
    else
      return 'application'
    end
  end

end
