Interior ![Travis CI Status](https://secure.travis-ci.org/climate/interior.png)
========

Township GeoCoder Web Service
-----------------------------
Interior uses the GeoCommunicator GeoCoder Web Service provided by the
[US Department of the Interior] [1]. For detailed documentation on the web service API, consult the
[Methods, Parameters, and Results PDF] [2].

[1]: http://www.geocommunicator.gov/GeoComm/lsis_home/townshipdecoder/index.htm "US Department of the Interior"
[2]: http://www.blm.gov/nils/GeoComm/documents/NILS_GeoCommunicator_Web_Services_TGC_Formats.pdf "Methods, Parameters, and Results PDF"

Usage: Get Latitude / Longitude
-------------------------------
Given township `1N`, range `1E`, section `35`, and meridian `14` (Gila-Salt Meridian
in the US Meridian table), we can get the center point latitude and longitude
in the state of Arizona with:

    require 'interior'
    response = Interior::Geocoder.get_lat_lon('AZ', 14, 1, 'N', 1, 'E', 35)
    response.success?   => true
    response.latitude   => 33.384549272498
    response.longitude  => -112.228362739723

![Usage Map 1](https://github.com/climate/interior/raw/master/maps/usage_map_01.png "Usage Map 1")

Section is option. If omitted, the centerpoint latitude and longitude will be for
the township and range:

    require 'interior'
    response = Interior::Geocoder.get_lat_lon('AZ', 14, 1, 'N', 1, 'E') # no section
    response.success?   => true
    response.latitude   => 33.4211630233451
    response.longitude  => -112.254699834217

![Usage Map 2](https://github.com/climate/interior/raw/master/maps/usage_map_02.png "Usage Map 2")

Usage: Get Meridians
--------------------
For a collection of all meridians in Arizona:

    require 'interior'
    meridians = Interior::Geocoder.get_meridians('AZ')
    meridians.inspect
      => [ { :name => 'Gila-Salt River', :id => 14 },
           { :name => 'Navajo',          :id => 22 },
           { :name => 'San Bernardino',  :id => 27 } ]

US Meridian Map
---------------
The US is divided into several meridians. A [larger map] [3] and table are available for reference.

![USA Meridians](https://github.com/climate/interior/raw/master/maps/meridians_small.jpg "USA Meridians")

[3]: https://github.com/climate/interior/raw/master/maps/meridians.jpg "Larger Map"

US Meridian Table
-----------------
Each meridian has a corresponding numeric key mapping:

<table>
  <tr>
    <th>State</th>
    <th>Meridian</th>
    <th>Code</th>
    <th>State</th>
    <th>Meridian</th>
    <th>Code</th>
  </tr>
  <tr>
    <td>AL</td>
    <td>Huntsville</td>
    <td>16</td>
    <td>AL</td>
    <td>St. Stephens</td>
    <td>25</td>
  </tr>
  <tr>
    <td>AL</td>
    <td>Tallahasee</td>
    <td>29</td>
    <td>AR</td>
    <td>5th</td>
    <td>05</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>Gila-Salt River</td>
    <td>14</td>
    <td>AZ</td>
    <td>Navajo</td>
    <td>22</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>San Bernardino</td>
    <td>27</td>
    <td>CA</td>
    <td>Gila-Salt River</td>
    <td>14</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>Humboldt</td>
    <td>15</td>
    <td>CA</td>
    <td>Mount Diablo</td>
    <td>21</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>San Bernardino</td>
    <td>27</td>
    <td>CO</td>
    <td>6th</td>
    <td>06</td>
  </tr>
  <tr>
    <td>CO</td>
    <td>New Mex</td>
    <td>23</td>
    <td>CO</td>
    <td>Ute</td>
    <td>31</td>
  </tr>
  <tr>
    <td>FL</td>
    <td>Tallahasee</td>
    <td>29</td>
    <td>IA</td>
    <td>5th</td>
    <td>05</td>
  </tr>
  <tr>
    <td>ID</td>
    <td>Boise</td>
    <td>08</td>
    <td>IL</td>
    <td>2nd</td>
    <td>02</td>
  </tr>
  <tr>
    <td>IL</td>
    <td>3rd</td>
    <td>03</td>
    <td>IL</td>
    <td>4th Illinois</td>
    <td>04</td>
  </tr>
  <tr>
    <td>IN</td>
    <td>1st</td>
    <td>01</td>
    <td>IN</td>
    <td>2nd</td>
    <td>02</td>
  </tr>
  <tr>
    <td>KS</td>
    <td>6th</td>
    <td>06</td>
    <td>LA</td>
    <td>Louisiana</td>
    <td>18</td>
  </tr>
  <tr>
    <td>LA</td>
    <td>St. Helena</td>
    <td>24</td>
    <td>MI</td>
    <td>Michigan</td>
    <td>19</td>
  </tr>
  <tr>
    <td>MN</td>
    <td>5th</td>
    <td>05</td>
    <td>MN</td>
    <td>4th</td>
    <td>46</td>
  </tr>
  <tr>
    <td>MO</td>
    <td>5th</td>
    <td>05</td>
    <td>MS</td>
    <td>Chickasaw</td>
    <td>09</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>Choctaw</td>
    <td>10</td>
    <td>MS</td>
    <td>Huntsville</td>
    <td>16</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>St. Stephens</td>
    <td>25</td>
    <td>MS</td>
    <td>Washington</td>
    <td>32</td>
  </tr>
  <tr>
    <td>MT</td>
    <td>Prin</td>
    <td>20</td>
    <td>ND</td>
    <td>5th</td>
    <td>05</td>
  </tr>
  <tr>
    <td>NE</td>
    <td>6th</td>
    <td>06</td>
    <td>NM</td>
    <td>New Mex</td>
    <td>23</td>
  </tr>
  <tr>
    <td>NV</td>
    <td>Mount Diablo</td>
    <td>21</td>
    <td>NV</td>
    <td>San Bernardino</td>
    <td>27</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>1st</td>
    <td>01</td>
    <td>OH</td>
    <td>Michigan</td>
    <td>19</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>Ohio River Survey</td>
    <td>35</td>
    <td>OH</td>
    <td>Between the Miamis</td>
    <td>36</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>Muskingum River Basin</td>
    <td>37</td>
    <td>OH</td>
    <td>Ohio River Basin</td>
    <td>38</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>1st Scioto River Base</td>
    <td>39</td>
    <td>OH</td>
    <td>2nd Scioto River Base</td>
    <td>40</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>3rd Scioto River Base</td>
    <td>41</td>
    <td>OH</td>
    <td>Twelve Mile Square</td>
    <td>43</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>West of Great Miami</td>
    <td>47</td>
    <td>OH</td>
    <td>US Military Survey</td>
    <td>48</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>Ct West Res</td>
    <td>91</td>
    <td>OH</td>
    <td>Ohio CO Pur</td>
    <td>92</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>Va Military Survey</td>
    <td>93</td>
    <td>OK</td>
    <td>Cimarron</td>
    <td>11</td>
  </tr>
  <tr>
    <td>OK</td>
    <td>Indian</td>
    <td>17</td>
    <td>OR</td>
    <td>Willamette</td>
    <td>33</td>
  </tr>
  <tr>
    <td>SD</td>
    <td>5th</td>
    <td>05</td>
    <td>SD</td>
    <td>6th</td>
    <td>06</td>
  </tr>
  <tr>
    <td>SD</td>
    <td>Black Hills</td>
    <td>07</td>
    <td>UT</td>
    <td>Salt Lake</td>
    <td>26</td>
  </tr>
  <tr>
    <td>UT</td>
    <td>Uintah Spec</td>
    <td>30</td>
    <td>WA</td>
    <td>Willamette</td>
    <td>33</td>
  </tr>
  <tr>
    <td>WI</td>
    <td>4th</td>
    <td>46</td>
    <td>WY</td>
    <td>6th</td>
    <td>06</td>
  </tr>
  <tr>
    <td>WY</td>
    <td>Wind River</td>
    <td>34</td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
