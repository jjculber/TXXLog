# == Schema Information
#
# Table name: log_entries
#
#  id         :integer          not null, primary key
#  event_id   :integer          not null
#  contact_at :datetime
#  callsign   :string
#  category   :string
#  section    :string
#  station_id :integer          not null
#  user_id    :integer          not null
#  frequency  :integer
#  mode       :string
#  deleted    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class LogEntry < ApplicationRecord
  belongs_to :event
  belongs_to :station, optional: true
  belongs_to :user, optional: true


  BANDS = [
      ['160M / 1.8MHz', 1800],
      ['80M / 3.5MHz', 3500],
      ['40M / 7MHz', 7000],
      ['20M / 14MHz', 14000],
      ['15M / 21MHz', 21000],
      ['10M / 28MHZ', 28000],
      ['6M / 50MHz', 50000],
      ['2M / 144MHz', 144000],
      ['1.25M / 222MHz', 222000],
      ['70cm / 432MHz', 432000],
      ['33cm / 902MHz', 902000],
      ['23cm / 1.2GHz', 1200000],
      ['2.3G', '2.3G'],
      ['3.4G', '3.4G'],
      ['5.7G', '5.7G'],
      ['10G', '10G'],
      ['24G', '24G'],
      ['47G', '47G'],
      ['75G', '75G'],
      ['123G', '123G'],
      ['134G', '134G'],
      ['241G', '241G'],
      ['Light', 'Light']
  ]

  MODES = [
      ['CW/Morse', 'CW'],
      ['Phone', 'PH'],
      ['Digital', 'DI']
  ]

  ARRL_SECTIONS = [
      ['Call Sign Area 1', [
          ['CT - Connecticut', 'CT'],
          ['EMA - Eastern  Massachusetts', 'EMA'],
          ['ME - Maine', 'ME'],
          ['NH - New Hampshire', 'NH'],
          ['RT - Rhode Island', 'RI'],
          ['VT - Vermont', 'VT'],
          ['WMA - Western Massachusetts', 'WMA']]],

      ['Call Sign Area 2', [
          ['ENY - Eastern New York', 'ENY'],
          ['NLI - New York City - Long Island', 'NLI'],
          ['NNJ - Northern New Jersey', 'NNJ'],
          ['NNY - Northern New York', 'NNY'],
          ['SNJ - Southern New Jersey', 'SNJ'],
          ['WNY - Western New York', 'WNY']]],

      ['Call Sign Area 3', [
          ['DE - Delaware', 'DE'],
          ['EPA - Eastern Pennsylvania', 'EPA'],
          ['MDC - Maryland-DC', 'MDC'],
          ['WPA - Western Pennsylvania', 'WPA']]],

      ['Call Sign Area 4', [
          ['AL - Alabama', 'AL'],
          ['GA - Georgia', 'GA'],
          ['KY - Kentucky', 'KY'],
          ['NC - North Carolina', 'NC'],
          ['NFL - Northern Florida', 'NFL'],
          ['SC - South Carolina', 'SC'],
          ['SFL - Southern Florida', 'SFL'],
          ['WCF - West  Central Florida', 'WCF'],
          ['TN - Tennessee', 'TN'],
          ['VA - Virginia', 'VA'],
          ['PR - Puerto Rico', 'PR'],
          ['VI - Virgin Islands', 'VI']]],

      ['Call Sign Area 5', [
          ['AR - Arkansas', 'AR'],
          ['LA - Louisiana', 'LA'],
          ['MS - Mississippi', 'MS'],
          ['NM - New Mexico', 'NM'],
          ['NTX - North Texas', 'NTX'],
          ['OK - Oklahoma', 'OK'],
          ['STX - South Texas', 'STX'],
          ['WTX - West Texas', 'WTX']]],

      ['Call Sign Area 6', [
          ['EB - East Bay', 'EB'],
          ['LAX - Los Angeles', 'LAX'],
          ['ORG - Orange', 'ORG'],
          ['SB - Santa Barbara', 'SB'],
          ['SCV - Santa Clara Valley', 'SCV'],
          ['SDG - San Diego', 'SDG'],
          ['SF - San Francisco', 'SF'],
          ['SJV - San Joaquin Valley', 'SJV'],
          ['SV - Sacramento Valley', 'SV'],
          ['PAC - Pacific', 'PAC']]],

      ['Call Sign Area 7', [
          ['AZ - Arizona', 'AZ'],
          ['EWA - Eastern Washington', 'EWA'],
          ['ID - Idaho', 'ID'],
          ['MT - Montana', 'MT'],
          ['NV - Nevada', 'NV'],
          ['OR - Oregon', 'OR'],
          ['UT - Utah', 'UT'],
          ['WWA - Western Washington', 'WWA'],
          ['WY - Wyoming', 'WY'],
          ['AK - Alaska', 'AK']]],

      ['Call Sign Area 8', [
          ['MI - Michigan', 'MI'],
          ['OH - Ohio', 'OH'],
          ['WV - West Virginia', 'WV']]],

      ['Call Sign Area 9', [
          ['IL - Illinois', 'IL'],
          ['IN - Indiana', 'IN'],
          ['WI - Wisconsin', 'WI']]],

      ['Call Sign Area 0', [
          ['CO - Colorado', 'CO'],
          ['IA - Iowa', 'IA'],
          ['KS - Kansas', 'KS'],
          ['MN - Minnesota', 'MN'],
          ['MO - Missouri', 'MO'],
          ['NE - Nebraska', 'NE'],
          ['ND - North Dakota', 'ND'],
          ['SD - South Dakota', 'SD']]],

      ['Canadian Area Call Sign', [
          ['MAR - Maritime', 'MAR'],
          ['NL - Newfoundland/Labrador', 'NL'],
          ['QC - Quebec', 'QC'],
          ['ONE - Ontario East', 'ONE'],
          ['ONN - Ontario North', 'ONN'],
          ['ONS - Ontario South', 'ONS'],
          ['GTA - Greater Toronto Area', 'GTA'],
          ['MB - Manitoba', 'MB'],
          ['SK - Saskatchewan', 'SK'],
          ['AB - Alberta', 'AB'],
          ['BC - British Columbia', 'BC'],
          ['NT - Northern Territories', 'NT']]],
      ['Other', [['DX', 'DX']]]

  ]

  def self.to_csv
    attributes = %w(id callsign frequency mode created_at updated_at contact_at section category)
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |log_entry|
        csv << attributes.map{ |attr| log_entry.send(attr) }
      end
    end
  end

end
