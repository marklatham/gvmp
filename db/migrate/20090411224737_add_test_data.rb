class AddTestData < ActiveRecord::Migration
  
  def self.up

  Community.delete_all

  Community.create(
    :name => 'Mountain Equipment Co-op',
    :short_name => 'MEC',
    :category => 'Co-op',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Mountain_Equipment_Co-op',
    :official_url => 'http://www.mec.ca',
    :description => '')

  Community.create(
    :name => 'Ballard Power Systems',
    :short_name => 'Ballard Power',
    :category => 'Corporation',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Burnaby',
    :wiki_url => 'http://en.wikipedia.org/wiki/Ballard_Power_Systems',
    :official_url => 'http://www.ballard.com/',
    :description => 'TSX, NASDAQ, BLDP')

  Community.create(
    :name => 'Canadian Broadcasting Corporation',
    :short_name => 'CBC',
    :category => 'Corporation',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Broadcasting_Corporation',
    :official_url => 'http://www.cbc.radio-canada.ca/',
    :description => 'CBC is a crown corporation, not a publicly-traded corporation. So its voter community is all citizens of Canada.')

  Community.create(
    :name => 'Telus',
    :short_name => 'Telus',
    :category => 'Corporation',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Burnaby',
    :wiki_url => 'http://en.wikipedia.org/wiki/Telus',
    :official_url => 'http://www.telus.com/',
    :description => 'TSE, T, T.A')

  Community.create(
    :name => 'Canada',
    :short_name => 'Canada',
    :category => 'Country',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canada',
    :official_url => 'http://canada.gc.ca/',
    :description => '')

  Community.create(
    :name => 'Coast Capital Savings',
    :short_name => 'Coast Capital',
    :category => 'Credit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Coast_Capital_Savings',
    :official_url => 'https://www.coastcapitalsavings.com/',
    :description => '')

  Community.create(
    :name => 'North Shore Credit Union',
    :short_name => 'North Shore CU',
    :category => 'Credit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'North Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/North_Shore_Credit_Union',
    :official_url => 'https://www.nscu.com/',
    :description => '')

  Community.create(
    :name => 'Vancouver City Savings Credit Union',
    :short_name => 'VanCity',
    :category => 'Credit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vancity',
    :official_url => 'https://www.vancity.com/',
    :description => '')

  Community.create(
    :name => 'Westminster Savings Credit Union',
    :short_name => 'Westminster Savings',
    :category => 'Credit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'New Westminster',
    :wiki_url => 'None as of January 2009',
    :official_url => 'https://www.wscu.com',
    :description => '')

  Community.create(
    :name => 'Classico condo, 1328 W Pender St, Vancouver',
    :short_name => 'Classico',
    :category => 'Homeowner',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'None as of March 2009',
    :official_url => 'http://www.theclassico.ca/',
    :description => 'BCS 460. 1328 West Pender Street, Vancouver, BC, Canada V6E 4T1')

  Community.create(
    :name => 'B.C. Government & Service Employees Union',
    :short_name => 'BCGSEU',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => '',
    :official_url => 'http://www.bcgeu.bc.ca/',
    :description => 'British Columbia Government and Service Employees Union')

  Community.create(
    :name => 'British Columbia Federation of Labour',
    :short_name => 'BC Fed\'n of Labour',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/British_Columbia_Federation_of_Labour',
    :official_url => 'http://www.bcfed.com/',
    :description => '')

  Community.create(
    :name => 'British Columbia Nurses\' Union',
    :short_name => 'BC Nurses\' Union',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.bcnu.org',
    :description => '')

  Community.create(
    :name => 'British Columbia Teachers\' Federation',
    :short_name => 'BCTF',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/British_Columbia_Teachers_Federation',
    :official_url => 'http://www.bctf.ca/',
    :description => '')

  Community.create(
    :name => 'Canadian Association of University Teachers',
    :short_name => 'Cdn Ass\'n U Teachers',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => 'http://www.caut.ca',
    :description => '')

  Community.create(
    :name => 'Canadian Auto Workers',
    :short_name => 'Cdn Auto Workers',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Auto_Workers',
    :official_url => 'http://www.caw.ca',
    :description => '')

  Community.create(
    :name => 'Canadian Auto Workers Local 111',
    :short_name => 'CAW Local 111',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/CAW_Local_111',
    :official_url => 'http://www.caw111.com/',
    :description => 'bus drivers')

  Community.create(
    :name => 'Canadian Union of Public Employees',
    :short_name => 'CUPE',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/CUPE',
    :official_url => 'http://cupe.ca/',
    :description => '')

  Community.create(
    :name => 'Fédération des travailleurs/-euses du Québec',
    :short_name => 'Féd\'n trav. Québec',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'Québec',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Fédération_des_travailleurs_du_Québec',
    :official_url => 'http://www.ftq.qc.ca/',
    :description => 'Fédération des travailleurs et travailleuses du Québec, QFL, Quebec Federation of Labour')

  Community.create(
    :name => 'Hospital Employees\' Union (British Columbia)',
    :short_name => 'HospitalEmployees BC',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Hospital_Employees%27_Union',
    :official_url => 'http://www.heu.org/',
    :description => '')

  Community.create(
    :name => 'Vancouver Police Union',
    :short_name => 'Vancouver Police',
    :category => 'Labour',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vancouver_Police_Union',
    :official_url => 'http://www.vpu.ca/',
    :description => '')

  Community.create(
    :name => 'Abbotsford',
    :short_name => 'Abbotsford',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Abbotsford',
    :wiki_url => 'http://en.wikipedia.org/wiki/Abbotsford,_British_Columbia',
    :official_url => 'http://www.abbotsford.ca/site4.aspx',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Anmore',
    :short_name => 'Anmore',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Anmore',
    :wiki_url => 'http://en.wikipedia.org/wiki/Anmore',
    :official_url => 'http://www.anmore.com/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Belcarra',
    :short_name => 'Belcarra',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Belcarra',
    :wiki_url => 'http://en.wikipedia.org/wiki/Belcarra,_British_Columbia',
    :official_url => 'http://www.belcarra.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Bowen Island',
    :short_name => 'Bowen Island',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Bowen Island',
    :wiki_url => 'http://en.wikipedia.org/wiki/Bowen_island',
    :official_url => 'http://www.bowenisland.com/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Burnaby',
    :short_name => 'Burnaby',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Burnaby',
    :wiki_url => 'http://en.wikipedia.org/wiki/Burnaby',
    :official_url => 'http://www.city.burnaby.bc.ca/Home.html',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Chilliwack',
    :short_name => 'Chilliwack',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Chilliwack',
    :wiki_url => 'http://en.wikipedia.org/wiki/Chilliwack,_British_Columbia',
    :official_url => 'http://www.gov.chilliwack.bc.ca/main/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Coquitlam',
    :short_name => 'Coquitlam',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Coquitlam',
    :wiki_url => 'http://en.wikipedia.org/wiki/Coquitlam',
    :official_url => 'http://www.coquitlam.ca/default.htm',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Delta',
    :short_name => 'Delta',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Delta',
    :wiki_url => 'http://en.wikipedia.org/wiki/Delta,_British_Columbia',
    :official_url => 'http://www.delta.com/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Gibsons',
    :short_name => 'Gibsons',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Gibsons',
    :wiki_url => 'http://en.wikipedia.org/wiki/Gibsons,_British_Columbia',
    :official_url => 'http://www.gibsons.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Harrison Hot Springs',
    :short_name => 'Harrison Hot Springs',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Harrison Hot Springs',
    :wiki_url => 'http://en.wikipedia.org/wiki/Harrison_Hot_Springs',
    :official_url => 'http://www.harrisonhotsprings.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Hope',
    :short_name => 'Hope',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Hope',
    :wiki_url => 'http://en.wikipedia.org/wiki/Hope,_British_Columbia',
    :official_url => 'http://www.hopebc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Kent',
    :short_name => 'Kent',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Kent',
    :wiki_url => 'http://en.wikipedia.org/wiki/Kent,_British_Columbia',
    :official_url => 'http://www.district.kent.bc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Langley (City)',
    :short_name => 'Langley (City)',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Langley (City)',
    :wiki_url => 'http://en.wikipedia.org/wiki/Langley,_British_Columbia_(city)',
    :official_url => 'http://www.city.langley.bc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Langley (District Municipality)',
    :short_name => 'Langley (District)',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Langley (District)',
    :wiki_url => 'http://en.wikipedia.org/wiki/Langley,_British_Columbia_(district_municipality)',
    :official_url => 'http://www.tol.bc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Lillooet',
    :short_name => 'Lillooet',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Lillooet',
    :wiki_url => 'http://en.wikipedia.org/wiki/Lillooet,_British_Columbia',
    :official_url => 'http://www.lillooetbc.com/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Lions Bay',
    :short_name => 'Lions Bay',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Lions Bay',
    :wiki_url => 'http://en.wikipedia.org/wiki/Lions_Bay',
    :official_url => 'http://www.lionsbay.citymax.com/page/page/479914.htm',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Maple Ridge',
    :short_name => 'Maple Ridge',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Maple Ridge',
    :wiki_url => 'http://en.wikipedia.org/wiki/Maple_Ridge',
    :official_url => 'http://www.mapleridge.org/EN/index.html',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Mission',
    :short_name => 'Mission',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Mission',
    :wiki_url => 'http://en.wikipedia.org/wiki/District_of_Mission',
    :official_url => 'http://www.mission.ca/site3.aspx',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'New Westminster',
    :short_name => 'New Westminster',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'New Westminster',
    :wiki_url => 'http://en.wikipedia.org/wiki/New_Westminster',
    :official_url => 'http://www.newwestcity.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'North Vancouver (City)',
    :short_name => 'North Van (City)',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'North Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(city)',
    :official_url => 'http://www.cnv.org/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'North Vancouver (District Municipality)',
    :short_name => 'North Van (District)',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'North Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/North_Vancouver,_British_Columbia_(district_municipality)',
    :official_url => 'http://www.district.north-van.bc.ca/article.asp?c=78',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Pemberton',
    :short_name => 'Pemberton',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Pemberton',
    :wiki_url => 'http://en.wikipedia.org/wiki/Pemberton,_British_Columbia',
    :official_url => 'http://www.pemberton.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Pitt Meadows',
    :short_name => 'Pitt Meadows',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Pitt Meadows',
    :wiki_url => 'http://en.wikipedia.org/wiki/Pitt_Meadows',
    :official_url => 'http://www.pittmeadows.bc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Port Coquitlam',
    :short_name => 'Port Coquitlam',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Port Coquitlam',
    :wiki_url => 'http://en.wikipedia.org/wiki/Port_Coquitlam',
    :official_url => 'http://www.city.port-coquitlam.bc.ca/Home_Page.htm',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Port Moody',
    :short_name => 'Port Moody',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Port Moody',
    :wiki_url => 'http://en.wikipedia.org/wiki/Port_Moody',
    :official_url => 'http://www.cityofportmoody.com/default.htm',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Richmond',
    :short_name => 'Richmond',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Richmond',
    :wiki_url => 'http://en.wikipedia.org/wiki/Richmond,_British_Columbia',
    :official_url => 'http://www.richmond.ca/home.htm',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Sechelt',
    :short_name => 'Sechelt',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Sechelt',
    :wiki_url => 'http://en.wikipedia.org/wiki/Sechelt',
    :official_url => 'http://www.district.sechelt.bc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Squamish',
    :short_name => 'Squamish',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Squamish',
    :wiki_url => 'http://en.wikipedia.org/wiki/Squamish',
    :official_url => 'http://www.squamish.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Surrey',
    :short_name => 'Surrey',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Surrey',
    :wiki_url => 'http://en.wikipedia.org/wiki/Surrey,_British_Columbia',
    :official_url => 'http://www.surrey.ca/default.htm',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Vancouver',
    :short_name => 'Vancouver',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vancouver',
    :official_url => 'http://www.vancouver.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Victoria',
    :short_name => 'Victoria',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Victoria',
    :wiki_url => 'http://en.wikipedia.org/wiki/Victoria,_British_Columbia',
    :official_url => 'http://www.victoria.ca',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'West Vancouver',
    :short_name => 'West Vancouver',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'West Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/West_Vancouver',
    :official_url => 'http://www.westvancouver.net/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'Whistler',
    :short_name => 'Whistler',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Whistler',
    :wiki_url => 'http://en.wikipedia.org/wiki/Whistler_(British_Columbia)',
    :official_url => 'http://www.whistler.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'White Rock',
    :short_name => 'White Rock',
    :category => 'Municipal',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'White Rock',
    :wiki_url => 'http://en.wikipedia.org/wiki/White_Rock,_British_Columbia',
    :official_url => 'http://www.city.whiterock.bc.ca/',
    :description => 'GVRD, Metro Vancouver')

  Community.create(
    :name => 'British Columbia Automobile Association',
    :short_name => 'BC Auto Association',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.bcaa.com',
    :description => '')

  Community.create(
    :name => 'British Columbia Medical Association',
    :short_name => 'BC Medical Ass\'n',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.bcma.org/',
    :description => '')

  Community.create(
    :name => 'Canadian Automobile Association',
    :short_name => 'Canadian Auto Ass\'n',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Automobile_Association',
    :official_url => 'http://www.caa.ca/',
    :description => '')

  Community.create(
    :name => 'Canadian Internet Registration Authority',
    :short_name => 'Cdn Internet Reg Aut',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Internet_Registration_Authority',
    :official_url => 'http://www.cira.ca/en/home.html',
    :description => '')

  Community.create(
    :name => 'Canadian Red Cross',
    :short_name => 'Canadian Red Cross',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Red_Cross',
    :official_url => 'http://www.redcross.ca/',
    :description => '')

  Community.create(
    :name => 'Canadian Standards Association',
    :short_name => 'Cdn Standards Ass\'n',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Standards_Association',
    :official_url => 'http://www.csa.ca',
    :description => '')

  Community.create(
    :name => 'Coal Harbour Residents Association',
    :short_name => 'Coal Harbour Res.',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Coal_Harbour',
    :official_url => 'http://www.ch-ra.ca/',
    :description => '')

  Community.create(
    :name => 'Downtown Eastside Residents’ Association',
    :short_name => 'Dntn Eastside Res.',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Downtown_Eastside_Residents_Association',
    :official_url => 'http://www.dera.bc.ca/',
    :description => '')

  Community.create(
    :name => 'Fair Vote Canada',
    :short_name => 'Fair Vote Canada',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Law Society of BC',
    :short_name => 'Law Society of BC',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => '',
    :official_url => 'http://www.lawsociety.bc.ca/',
    :description => '')

  Community.create(
    :name => 'University of British Columbia Alumni Association',
    :short_name => 'UBC Alumni Ass\'n',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/University_of_British_Columbia',
    :official_url => 'http://www.alumni.ubc.ca/',
    :description => '')

  Community.create(
    :name => 'Vancouver Board of Trade',
    :short_name => 'Van. Board of Trade',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vancouver_Board_of_Trade',
    :official_url => 'http://www.boardoftrade.com/',
    :description => '')

  Community.create(
    :name => 'Vancouver Community Network',
    :short_name => 'Van. Comm\'y Network',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vancouver_Community_Network',
    :official_url => 'http://www2.vcn.bc.ca/',
    :description => '')

  Community.create(
    :name => 'West End Residents Association',
    :short_name => 'West End Res. Ass\'n',
    :category => 'Nonprofit',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.wera.bc.ca/',
    :description => '')

  Community.create(
    :name => 'Bloc Québécois',
    :short_name => 'Bloc Québécois',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Bloc_Québécois',
    :official_url => 'http://www.blocquebecois.org/',
    :description => '')

  Community.create(
    :name => 'Conservative Party of Canada',
    :short_name => 'Conservative Party',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Conservative_Party_of_Canada',
    :official_url => 'http://www.conservative.ca/',
    :description => '')

  Community.create(
    :name => 'Green Party of Canada',
    :short_name => 'Green Party',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Green_Party_of_Canada',
    :official_url => 'http://www.green.ca/',
    :description => '')

  Community.create(
    :name => 'Liberal Party of Canada',
    :short_name => 'Liberal Party',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Liberal_Party_of_Canada',
    :official_url => 'http://www.liberal.ca/',
    :description => '')

  Community.create(
    :name => 'New Democratic Party',
    :short_name => 'NDP',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/New_Democratic_Party',
    :official_url => 'http://www.ndp.ca/',
    :description => '')

  Community.create(
    :name => 'British Columbia Liberal Party',
    :short_name => 'BC Liberals',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/British_Columbia_Liberal_Party',
    :official_url => 'http://www.bcliberals.com/',
    :description => '')

  Community.create(
    :name => 'Green Party of British Columbia',
    :short_name => 'Green Party of BC',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Green_Party_of_British_Columbia',
    :official_url => 'http://www.greenparty.bc.ca/',
    :description => '')

  Community.create(
    :name => 'New Democratic Party of British Columbia',
    :short_name => 'BC NDP',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/New_Democratic_Party_of_British_Columbia',
    :official_url => 'http://www.bcndp.ca/',
    :description => '')

  Community.create(
    :name => 'Coalition of Progressive Electors',
    :short_name => 'COPE',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Coalition_of_Progressive_Electors',
    :official_url => 'http://www.cope.bc.ca/',
    :description => '')

  Community.create(
    :name => 'Non-Partisan Association',
    :short_name => 'NPA',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Non-Partisan_Association',
    :official_url => 'http://www.npavancouver.ca/',
    :description => '')

  Community.create(
    :name => 'Vision Vancouver',
    :short_name => 'Vision Vancouver',
    :category => 'Political',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vision_Vancouver',
    :official_url => 'http://www.votevision.ca/',
    :description => '')

  Community.create(
    :name => 'British Columbia',
    :short_name => 'British Columbia',
    :category => 'Province',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/British_Columbia',
    :official_url => 'http://www.gov.bc.ca/',
    :description => '')

  Community.create(
    :name => 'Alma Mater Society of the U. of British Columbia',
    :short_name => 'UBC AMS',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia',
    :official_url => 'http://www.amsubc.ca/',
    :description => 'Alma Mater Society of the University of British Columbia')

  Community.create(
    :name => 'BCIT Student Association',
    :short_name => 'BCIT Student Ass\'n',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.bcitsa.ca/',
    :description => 'British Columbia Institute of Technology Student Association')

  Community.create(
    :name => 'Canadian Alliance of Student Associations',
    :short_name => 'CASA',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Alliance_of_Student_Associations',
    :official_url => 'http://www.casa.ca/',
    :description => '')

  Community.create(
    :name => 'Canadian Federation of Students',
    :short_name => 'CFS',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Canadian_Federation_of_Students',
    :official_url => 'http://www.cfs-fcee.ca/',
    :description => '')

  Community.create(
    :name => 'Capilano Students\' Union',
    :short_name => 'Capilano Students',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'North Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Capilano_University',
    :official_url => 'http://www.csu.bc.ca/',
    :description => '')

  Community.create(
    :name => 'Douglas Students\' Union',
    :short_name => 'Douglas Students',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.cfslocal18.ca/',
    :description => '')

  Community.create(
    :name => 'Kwantlen Student Association',
    :short_name => 'Kwantlen Students',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Alma_Mater_Society_of_the_University_of_British_Columbia',
    :official_url => 'http://www.kusa.ca/',
    :description => '')

  Community.create(
    :name => 'Langara Students Union',
    :short_name => 'Langara Students',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.lsu.bc.ca/',
    :description => '')

  Community.create(
    :name => 'Northern Undergraduate Student Society',
    :short_name => 'Northern Undergrads',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Northern_Undergraduate_Student_Society',
    :official_url => 'http://nugss.unbc.ca/',
    :description => '')

  Community.create(
    :name => 'Simon Fraser Student Society',
    :short_name => 'Simon Fraser Student',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Simon_Fraser_Student_Society',
    :official_url => 'http://www.sfss.ca/',
    :description => '')

  Community.create(
    :name => 'Students\' Unions of Vancouver Community College',
    :short_name => 'Students\' Unions VCC',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Vancouver',
    :wiki_url => 'http://en.wikipedia.org/wiki/Vancouver_Community_College',
    :official_url => 'http://www.suvcc.ca/',
    :description => '')

  Community.create(
    :name => 'Trinity Western University Students Association',
    :short_name => 'TWU Students Ass\'n',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Trinity_Western_University_Students_Association',
    :official_url => 'http://www.twusa.ca/',
    :description => '')

  Community.create(
    :name => 'University of Calgary Students\' Union',
    :short_name => 'U Calgary Students',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'Alberta',
    :city => 'Calgary',
    :wiki_url => 'http://en.wikipedia.org/wiki/University_of_Calgary_Students%27_Union',
    :official_url => 'http://www.su.ucalgary.ca/',
    :description => '')

  Community.create(
    :name => 'University of the Fraser Valley Student Union Soc.',
    :short_name => 'UFV Student Union',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/UFV_Student_Union_Society',
    :official_url => 'http://www.ufvsus.ca/',
    :description => 'University of the Fraser Valley Student Union Society')

  Community.create(
    :name => 'University of Victoria Students’ Society',
    :short_name => 'UVic Students\' Soc.',
    :category => 'Student',
    :country => 'Canada',
    :prov_state => 'B.C.',
    :city => 'Victoria',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.uvss.uvic.ca/',
    :description => '')

  Community.create(
    :name => 'Conference Board',
    :short_name => 'Conference Board',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Conference_Board',
    :official_url => 'http://www.conference-board.org/',
    :description => '')

  Community.create(
    :name => 'Greenpeace',
    :short_name => 'Greenpeace',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Greenpeace',
    :official_url => 'http://www.greenpeace.org',
    :description => '28 autonomous branches')

  Community.create(
    :name => 'International Corporate Governance Network',
    :short_name => 'ICGN',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.icgn.org/',
    :description => '')

  Community.create(
    :name => 'Red Cross & Red Crescent Societies (Int\'l Fed\'n)',
    :short_name => 'Red Cross/Crescent',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/International_Federation_of_Red_Cross_and_Red_Crescent_Societies',
    :official_url => 'http://www.ifrc.org/',
    :description => 'International Federation of Red Cross and Red Crescent Societies')

  Community.create(
    :name => 'Servas International',
    :short_name => 'Servas International',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Servas_Open_Doors',
    :official_url => 'http://joomla.servas.org/',
    :description => 'open doors')

  Community.create(
    :name => 'Toastmasters International',
    :short_name => 'Toastmasters',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Toastmasters_International',
    :official_url => 'http://www.toastmasters.org/',
    :description => '')

  Community.create(
    :name => 'Transparency International',
    :short_name => 'Transparency Int\'l',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Transparency_International',
    :official_url => 'http://www.transparency.org/',
    :description => '')

  Community.create(
    :name => 'VoterMedia.org',
    :short_name => 'VoterMedia.org',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://votermedia.org',
    :description => '')

  Community.create(
    :name => 'Wikimedia Foundation',
    :short_name => 'Wikimedia Foundation',
    :category => 'Nonprofit',
    :country => 'International',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Wikimedia',
    :official_url => 'http://wikimediafoundation.org/wiki/Home',
    :description => '')

  Community.create(
    :name => 'UK Shareholders\' Association',
    :short_name => 'UK Shareholders Assn',
    :category => 'Nonprofit',
    :country => 'United Kingdom',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => 'http://www.uksa.org.uk/index.htm',
    :description => '')

  Community.create(
    :name => 'Harvard/MIT Cooperative Society',
    :short_name => 'Harvard/MIT Coop',
    :category => 'Co-op',
    :country => 'USA',
    :prov_state => 'Massachusetts',
    :city => 'Cambridge',
    :wiki_url => 'http://en.wikipedia.org/wiki/Harvard/MIT_Cooperative_Society',
    :official_url => 'http://www.thecoop.com/',
    :description => '')

  Community.create(
    :name => 'Recreational Equipment Inc.',
    :short_name => 'REI',
    :category => 'Co-op',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => 'Seattle',
    :wiki_url => 'http://en.wikipedia.org/wiki/REI',
    :official_url => 'http://www.rei.com/',
    :description => '')

  Community.create(
    :name => 'Microsoft',
    :short_name => 'Microsoft',
    :category => 'Corporation',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => 'Redmond',
    :wiki_url => 'http://en.wikipedia.org/wiki/Microsoft',
    :official_url => 'http://www.microsoft.com',
    :description => 'NASDAQ')

  Community.create(
    :name => 'Ticketmaster Entertainment, Inc.',
    :short_name => 'Ticketmaster',
    :category => 'Corporation',
    :country => 'USA',
    :prov_state => 'California',
    :city => 'West Hollywood',
    :wiki_url => '',
    :official_url => 'http://www.ticketmaster.com',
    :description => '')

  Community.create(
    :name => 'United States of America',
    :short_name => 'USA',
    :category => 'Country',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Usa',
    :official_url => 'http://www.usa.gov/',
    :description => '')

  Community.create(
    :name => 'American Century Investments',
    :short_name => 'American Century',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/American_Century_Investments',
    :official_url => 'https://www.americancentury.com/',
    :description => '')

  Community.create(
    :name => 'American Funds',
    :short_name => 'American Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/American_Funds',
    :official_url => 'http://www.americanfunds.com/',
    :description => '')

  Community.create(
    :name => 'Barclays Global Investors',
    :short_name => 'Barclays Global Inv.',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Barclays_Global_Investors',
    :official_url => 'http://www.barclaysglobal.com/',
    :description => '')

  Community.create(
    :name => 'Blackrock Funds',
    :short_name => 'Blackrock Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'California Public Employees Retirement System',
    :short_name => 'CalPERS',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Calvert Funds',
    :short_name => 'Calvert Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.calvert.com/',
    :description => '')

  Community.create(
    :name => 'Columbia Funds',
    :short_name => 'Columbia Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'DFA Funds',
    :short_name => 'DFA Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Dodge & Cox Funds',
    :short_name => 'Dodge & Cox Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Domini Social Investments',
    :short_name => 'Domini Social Inv\'ts',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.domini.com/',
    :description => '')

  Community.create(
    :name => 'Dreyfus Funds',
    :short_name => 'Dreyfus Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'DWS Funds',
    :short_name => 'DWS Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Evergreen Funds',
    :short_name => 'Evergreen Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Federated Funds',
    :short_name => 'Federated Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Fidelity Investments',
    :short_name => 'Fidelity',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Fidelity_Investments',
    :official_url => 'http://www.fidelity.com/',
    :description => '')

  Community.create(
    :name => 'Franklin Templeton Funds',
    :short_name => 'Franklin Templeton',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Goldman Sachs Funds',
    :short_name => 'Goldman Sachs Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Janus Funds',
    :short_name => 'Janus Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'MFS Funds',
    :short_name => 'MFS Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'MMA Praxis Funds',
    :short_name => 'MMA Praxis Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Morgan Stanley Funds',
    :short_name => 'Morgan Stanley Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Nationwide Funds',
    :short_name => 'Nationwide Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Neuberger Berman Funds',
    :short_name => 'Neuberger Berman',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Parnassus Funds',
    :short_name => 'Parnassus Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Pax World Funds',
    :short_name => 'Pax World Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Putnam Funds',
    :short_name => 'Putnam Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'RiverSource Funds',
    :short_name => 'RiverSource Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Schwab Funds',
    :short_name => 'Schwab Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Sentinel Funds',
    :short_name => 'Sentinel Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => 'Formerly Citizens')

  Community.create(
    :name => 'Smith Barney Funds',
    :short_name => 'Smith Barney Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'State Street Global Advisors',
    :short_name => 'State Street Global',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'T Rowe Price Funds',
    :short_name => 'T Rowe Price Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'TIAA – CREF',
    :short_name => 'TIAA-CREF',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/TIAA-CREF_Investment_Management',
    :official_url => 'http://www.tiaa-cref.org/',
    :description => 'Teachers Insurance and Annuity Association - College Retirement Equities Fund')

  Community.create(
    :name => 'Trillium Asset Management',
    :short_name => 'Trillium Asset Mgt',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://trilliuminvest.com/',
    :description => '')

  Community.create(
    :name => 'United Services Automobile Association',
    :short_name => 'USAA',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/USAA',
    :official_url => 'http://www.usaa.com/',
    :description => '')

  Community.create(
    :name => 'Van Kampen Funds',
    :short_name => 'Van Kampen Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Vanguard Group, The',
    :short_name => 'Vanguard Group',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/The_Vanguard_Group',
    :official_url => 'http://www.vanguard.com/',
    :description => '')

  Community.create(
    :name => 'Wells Fargo Funds',
    :short_name => 'Wells Fargo Funds',
    :category => 'Investor',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => '',
    :official_url => '',
    :description => '')

  Community.create(
    :name => 'Bellingham',
    :short_name => 'Bellingham',
    :category => 'Municipal',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => 'Bellingham',
    :wiki_url => 'http://en.wikipedia.org/wiki/Bellingham,_Washington',
    :official_url => 'http://www.bellingham.org/',
    :description => '')

  Community.create(
    :name => 'Berkeley',
    :short_name => 'Berkeley',
    :category => 'Municipal',
    :country => 'USA',
    :prov_state => 'California',
    :city => 'Berkeley',
    :wiki_url => 'http://en.wikipedia.org/wiki/Berkeley,_California',
    :official_url => 'http://www.ci.berkeley.ca.us/Home.aspx',
    :description => '')

  Community.create(
    :name => 'Cambridge',
    :short_name => 'Cambridge',
    :category => 'Municipal',
    :country => 'USA',
    :prov_state => 'Massachusetts',
    :city => 'Cambridge',
    :wiki_url => 'http://en.wikipedia.org/wiki/Cambridge,_Massachusetts',
    :official_url => 'http://www.cambridgema.gov/',
    :description => '')

  Community.create(
    :name => 'Seattle',
    :short_name => 'Seattle',
    :category => 'Municipal',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => 'Seattle',
    :wiki_url => 'http://en.wikipedia.org/wiki/Seattle',
    :official_url => 'http://www.seattle.gov/',
    :description => '')

  Community.create(
    :name => 'American Association of Individual Investors',
    :short_name => 'AAII',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/AAII',
    :official_url => 'http://www.aaii.com/',
    :description => '')

  Community.create(
    :name => 'American Association of Retired Persons',
    :short_name => 'AARP',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/AARP',
    :official_url => 'http://www.aarp.org/',
    :description => '')

  Community.create(
    :name => 'American Automobile Association',
    :short_name => 'AAA',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/American_Automobile_Association',
    :official_url => 'http://www.aaa.com/',
    :description => '')

  Community.create(
    :name => 'American Medical Association',
    :short_name => 'AMA',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/American_Medical_Association',
    :official_url => 'http://www.ama-assn.org/',
    :description => '')

  Community.create(
    :name => 'American Red Cross',
    :short_name => 'American Red Cross',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/American_Red_Cross',
    :official_url => 'http://www.redcross.org/',
    :description => '')

  Community.create(
    :name => 'Consumers Union',
    :short_name => 'Consumers Union',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Consumers_Union',
    :official_url => 'http://www.consumersunion.org/',
    :description => '')

  Community.create(
    :name => 'Council of Institutional Investors',
    :short_name => 'CII',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.cii.org/',
    :description => '')

  Community.create(
    :name => 'Nat\'l Assoc. for the Advancement of Colored People',
    :short_name => 'NAACP',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Naacp',
    :official_url => 'http://www.naacp.org/',
    :description => '')

  Community.create(
    :name => 'National Organization for Women',
    :short_name => 'NOW',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/National_Organization_for_Women',
    :official_url => 'http://www.now.org/',
    :description => '')

  Community.create(
    :name => 'National Rifle Association',
    :short_name => 'NRA',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/National_Rifle_Association',
    :official_url => 'http://www.nra.org/',
    :description => '')

  Community.create(
    :name => 'The Authors Guild',
    :short_name => 'Authors Guild',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Authors_Guild',
    :official_url => 'http://www.authorsguild.org/',
    :description => '')

  Community.create(
    :name => 'United Way of America',
    :short_name => 'United Way America',
    :category => 'Nonprofit',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/United_Way_of_America',
    :official_url => 'http://www.liveunited.org/',
    :description => '')

  Community.create(
    :name => 'Democratic Party (USA)',
    :short_name => 'Democratic Party',
    :category => 'Political',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Democratic_Party_(United_States)',
    :official_url => 'http://www.democrats.org/',
    :description => '')

  Community.create(
    :name => 'Green Party (USA)',
    :short_name => 'Green Party (USA)',
    :category => 'Political',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Green_Party_(United_States)',
    :official_url => 'http://www.gp.org/',
    :description => '')

  Community.create(
    :name => 'Libertarian Party (USA)',
    :short_name => 'Libertarian Party',
    :category => 'Political',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Libertarian_Party_(United_States)',
    :official_url => 'http://www.lp.org/',
    :description => '')

  Community.create(
    :name => 'MoveOn.org',
    :short_name => 'MoveOn.org',
    :category => 'Political',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Moveon',
    :official_url => 'http://www.moveon.org/',
    :description => '')

  Community.create(
    :name => 'Republican Party (USA)',
    :short_name => 'GOP',
    :category => 'Political',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Republican_Party_(United_States)',
    :official_url => 'http://www.gop.com/',
    :description => '')

  Community.create(
    :name => 'California',
    :short_name => 'California',
    :category => 'State',
    :country => 'USA',
    :prov_state => 'California',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Massachusetts',
    :official_url => 'http://www.ca.gov/',
    :description => '')

  Community.create(
    :name => 'Massachusetts',
    :short_name => 'Massachusetts',
    :category => 'State',
    :country => 'USA',
    :prov_state => 'Massachusetts',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Massachusetts',
    :official_url => 'http://www.mass.gov/',
    :description => '')

  Community.create(
    :name => 'Washington State',
    :short_name => 'Washington',
    :category => 'State',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/Washington',
    :official_url => 'http://access.wa.gov/',
    :description => '')

  Community.create(
    :name => 'Associated Students of Stanford University',
    :short_name => 'Stanford Students',
    :category => 'Student',
    :country => 'USA',
    :prov_state => 'California',
    :city => 'Palo Alto',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://assu.stanford.edu/home/',
    :description => '')

  Community.create(
    :name => 'Associated Students of U. of California, Berkeley',
    :short_name => 'Assoc Students of UC',
    :category => 'Student',
    :country => 'USA',
    :prov_state => 'California',
    :city => 'Berkeley',
    :wiki_url => 'http://en.wikipedia.org/wiki/Associated_Students_of_the_University_of_California',
    :official_url => 'http://www.asuc.org/',
    :description => 'Associated Students of the University of California, Berkeley')

  Community.create(
    :name => 'Associated Students of University of Washington',
    :short_name => 'Assoc Students of UW',
    :category => 'Student',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => 'Seattle',
    :wiki_url => 'http://en.wikipedia.org/wiki/Associated_Students_of_the_University_of_Washington',
    :official_url => 'http://www.asuw.org/',
    :description => 'Associated Students of the University of Washington')

  Community.create(
    :name => 'Associated Students of Western Washington Univ.',
    :short_name => 'Assoc. Students WWU',
    :category => 'Student',
    :country => 'USA',
    :prov_state => 'Washington',
    :city => 'Bellingham',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.as.wwu.edu/',
    :description => 'Associated Students of Western Washington University')

  Community.create(
    :name => 'Harvard Undergraduate Council',
    :short_name => 'Harvard Undergrads',
    :category => 'Student',
    :country => 'USA',
    :prov_state => 'Massachusetts',
    :city => 'Cambridge',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://www.uc.fas.harvard.edu/',
    :description => '')

  Community.create(
    :name => 'MIT Undergraduate Association',
    :short_name => 'MIT Undergrad Ass\'n',
    :category => 'Student',
    :country => 'USA',
    :prov_state => 'Massachusetts',
    :city => 'Cambridge',
    :wiki_url => 'None as of January 2009',
    :official_url => 'http://ua.mit.edu/',
    :description => 'Massachusetts Institute of Technology Undergraduate Association')

  Community.create(
    :name => 'United States Student Association',
    :short_name => 'US Student Ass\'n',
    :category => 'Student',
    :country => 'USA',
    :prov_state => '',
    :city => '',
    :wiki_url => 'http://en.wikipedia.org/wiki/United_States_Student_Association',
    :official_url => 'http://www.usstudents.org/',
    :description => '')

  end

  def self.down
  end
end
