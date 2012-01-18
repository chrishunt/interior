Interior ![Travis CI Status](https://secure.travis-ci.org/climate/interior.png)
========

Township GeoCoder Web Service
-----------------------------
Interior uses the GeoCommunicator GeoCoder Web Service provided by the
[US Department of the Interior] [1]. For detailed documentation on the web service API, consult the
[Methods, Parameters, and Results PDF] [2].

[1]: http://www.geocommunicator.gov/GeoComm/lsis_home/townshipdecoder/index.htm "US Department of the Interior"
[2]: http://www.blm.gov/nils/GeoComm/documents/NILS_GeoCommunicator_Web_Services_TGC_Formats.pdf "Methods, Parameters, and Results PDF"

Usage
-----
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
    response = Interior::Geocoder.get_lat_lon('AZ', 14, 1, 'N', 1, 'E') # No section
    response.success?   => true
    response.latitude   => 33.4211630233451
    response.longitude  => -112.254699834217

![Usage Map 2](https://github.com/climate/interior/raw/master/maps/usage_map_02.png "Usage Map 2")

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
    <td>HUNTSVILLE MER</td>
    <td>16</td>
    <td>AL</td>
    <td>ST. STEPHENS MER</td>
    <td>25</td>
  </tr>
  <tr>
    <td>AL</td>
    <td>TALLAHASEE MER</td>
    <td>29</td>
    <td>AR</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>GILA-SALT RIVER MER</td>
    <td>14</td>
    <td>AZ</td>
    <td>NAVAJO MER</td>
    <td>22</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>SAN BERNARDINO MER</td>
    <td>27</td>
    <td>CA</td>
    <td>GILA-SALT RIVER MER</td>
    <td>14</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>HUMBOLDT MER</td>
    <td>15</td>
    <td>CA</td>
    <td>MOUNT DIABLO MER</td>
    <td>21</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>SAN BERNARDINO MER</td>
    <td>27</td>
    <td>CO</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>CO</td>
    <td>NEW MEX PM</td>
    <td>23</td>
    <td>CO</td>
    <td>UTE MER</td>
    <td>31</td>
  </tr>
  <tr>
    <td>CT</td>
    <td>CONNECTICUT</td>
    <td>CT</td>
    <td>DE</td>
    <td>DELAWARE</td>
    <td>DE</td>
  </tr>
  <tr>
    <td>FL</td>
    <td>TALLAHASEE MER</td>
    <td>29</td>
    <td>GA</td>
    <td>GEORGIA</td>
    <td>GA</td>
  </tr>
  <tr>
    <td>IA</td>
    <td>5TH PM</td>
    <td>05</td>
    <td>ID</td>
    <td>BOISE MER</td>
    <td>08</td>
  </tr>
  <tr>
    <td>IL</td>
    <td>2ND PM</td>
    <td>02</td>
    <td>IL</td>
    <td>3RD PM</td>
    <td>03</td>
  </tr>
  <tr>
    <td>IL</td>
    <td>4TH PM ILLINOIS</td>
    <td>04</td>
    <td>IN</td>
    <td>1ST PM</td>
    <td>01</td>
  </tr>
  <tr>
    <td>IN</td>
    <td>2ND PM</td>
    <td>02</td>
    <td>KS</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>KY</td>
    <td>KENTUCKY</td>
    <td>KY</td>
    <td>LA</td>
    <td>LOUISIANA MER</td>
    <td>18</td>
  </tr>
  <tr>
    <td>LA</td>
    <td>ST. HELENA MER</td>
    <td>24</td>
    <td>MA</td>
    <td>MASSACHUSETS</td>
    <td>MA</td>
  </tr>
  <tr>
    <td>MD</td>
    <td>MARYLAND</td>
    <td>MD</td>
    <td>ME</td>
    <td>MAINE</td>
    <td>ME</td>
  </tr>
  <tr>
    <td>MI</td>
    <td>MICHIGAN MER</td>
    <td>19</td>
    <td>MN</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>MN</td>
    <td>4TH PM MN-WI</td>
    <td>46</td>
    <td>MO</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>CHICKASAW MER</td>
    <td>09</td>
    <td>MS</td>
    <td>CHOCTAW MER</td>
    <td>10</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>HUNTSVILLE MER</td>
    <td>16</td>
    <td>MS</td>
    <td>ST. STEPHENS MER</td>
    <td>25</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>WASHINGTON MER</td>
    <td>32</td>
    <td>MT</td>
    <td>PRIN MER, MT</td>
    <td>20</td>
  </tr>
  <tr>
    <td>NC</td>
    <td>NO CAROLINA</td>
    <td>NC</td>
    <td>ND</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>NE</td>
    <td>6TH PM</td>
    <td>06</td>
    <td>NH</td>
    <td>NEW HAMPSHIRE</td>
    <td>NH</td>
  </tr>
  <tr>
    <td>NJ</td>
    <td>NEW JERSEY</td>
    <td>NJ</td>
    <td>NM</td>
    <td>NEW MEX PM</td>
    <td>23</td>
  </tr>
  <tr>
    <td>NV</td>
    <td>MOUNT DIABLO MER</td>
    <td>21</td>
    <td>NV</td>
    <td>SAN BERNARDINO MER</td>
    <td>27</td>
  </tr>
  <tr>
    <td>NY</td>
    <td>NEW YORK</td>
    <td>NY</td>
    <td>OH</td>
    <td>1ST PM</td>
    <td>01</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>MICHIGAN MER</td>
    <td>19</td>
    <td>OH</td>
    <td>OHIO RIVER SURVEY</td>
    <td>35</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>BETWEEN THE MIAMIS</td>
    <td>36</td>
    <td>OH</td>
    <td>MUSKINGUM RIVER BASIN</td>
    <td>37</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO RIVER BASIN</td>
    <td>38</td>
    <td>OH</td>
    <td>1ST SCIOTO RIVER BASE</td>
    <td>39</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>2ND SCIOTO RIVER BASE</td>
    <td>40</td>
    <td>OH</td>
    <td>3RD SCIOTO RIVER BASE</td>
    <td>41</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>TWELVE MILE SQUARE</td>
    <td>43</td>
    <td>OH</td>
    <td>WEST OF GREAT MIAMI</td>
    <td>47</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>US MILITARY SURVEY</td>
    <td>48</td>
    <td>OH</td>
    <td>CT WEST RES-OHIO</td>
    <td>91</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO CO PUR-OHIO</td>
    <td>92</td>
    <td>OH</td>
    <td>VA MILITARY SURVEY-OHIO</td>
    <td>93</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO</td>
    <td>OH</td>
    <td>OK</td>
    <td>CIMARRON MER</td>
    <td>11</td>
  </tr>
  <tr>
    <td>OK</td>
    <td>INDIAN MER</td>
    <td>17</td>
    <td>OR</td>
    <td>WILLAMETTE MER</td>
    <td>33</td>
  </tr>
  <tr>
    <td>PA</td>
    <td>PENNSYLVANIA</td>
    <td>PA</td>
    <td>RI</td>
    <td>RHODE ISLAND</td>
    <td>RI</td>
  </tr>
  <tr>
    <td>SC</td>
    <td>SO CAROLINA</td>
    <td>SC</td>
    <td>SD</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>SD</td>
    <td>6TH PM</td>
    <td>06</td>
    <td>SD</td>
    <td>BLACK HILLS MER</td>
    <td>07</td>
  </tr>
  <tr>
    <td>TN</td>
    <td>TENNESSEE</td>
    <td>TN</td>
    <td>TX</td>
    <td>TEXAS</td>
    <td>TX</td>
  </tr>
  <tr>
    <td>UT</td>
    <td>SALT LAKE MER</td>
    <td>26</td>
    <td>UT</td>
    <td>UINTAH SPEC MER</td>
    <td>30</td>
  </tr>
  <tr>
    <td>VA</td>
    <td>VIRGINIA</td>
    <td>VA</td>
    <td>VT</td>
    <td>VERMONT</td>
    <td>VT</td>
  </tr>
  <tr>
    <td>WA</td>
    <td>WILLAMETTE MER</td>
    <td>33</td>
    <td>WI</td>
    <td>4TH PM MN-WI</td>
    <td>46</td>
  </tr>
  <tr>
    <td>WV</td>
    <td>WEST VIRGINIA</td>
    <td>WV</td>
    <td>WY</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>WY</td>
    <td>WIND RIVER MER</td>
    <td>34</td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
