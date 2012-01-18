Interior
========

Township GeoCoder Web Service
-----------------------------
This gem uses the GeoCommunicator GeoCoder Web Service provided by the
[US Department of the Interior](http://www.geocommunicator.gov/GeoComm/lsis_home/townshipdecoder/index.htm).
For detailed documentation on the web service API, consult the
[Methods, Parameters, and Results PDF](http://www.blm.gov/nils/GeoComm/documents/NILS_GeoCommunicator_Web_Services_TGC_Formats.pdf).

US Meridian Map
---------------
The US is divided into several meridians. A [larger map](https://github.com/climate/interior/raw/master/maps/meridians.jpg)
is also available for reference.

![USA Meridians](https://github.com/climate/interior/raw/master/maps/meridians_small.jpg "USA Meridians")

Each meridian has a corresponding numeric key mapping:

<table>
  <tr>
    <th>State</th>
    <th>Meridian</th>
    <th>Code</th>
  </tr>
  <tr>
    <td>AL</td>
    <td>HUNTSVILLE MER</td>
    <td>16</td>
  </tr>
  <tr>
    <td>AL</td>
    <td>ST. STEPHENS MER</td>
    <td>25</td>
  </tr>
  <tr>
    <td>AL</td>
    <td>TALLAHASEE MER</td>
    <td>29</td>
  </tr>
  <tr>
    <td>AR</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>GILA-SALT RIVER MER</td>
    <td>14</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>NAVAJO MER</td>
    <td>22</td>
  </tr>
  <tr>
    <td>AZ</td>
    <td>SAN BERNARDINO MER</td>
    <td>27</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>GILA-SALT RIVER MER</td>
    <td>14</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>HUMBOLDT MER</td>
    <td>15</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>MOUNT DIABLO MER</td>
    <td>21</td>
  </tr>
  <tr>
    <td>CA</td>
    <td>SAN BERNARDINO MER</td>
    <td>27</td>
  </tr>
  <tr>
    <td>CO</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>CO</td>
    <td>NEW MEX PM</td>
    <td>23</td>
  </tr>
  <tr>
    <td>CO</td>
    <td>UTE MER</td>
    <td>31</td>
  </tr>
  <tr>
    <td>CT</td>
    <td>CONNECTICUT</td>
    <td>CT</td>
  </tr>
  <tr>
    <td>DE</td>
    <td>DELAWARE</td>
    <td>DE</td>
  </tr>
  <tr>
    <td>FL</td>
    <td>TALLAHASEE MER</td>
    <td>29</td>
  </tr>
  <tr>
    <td>GA</td>
    <td>GEORGIA</td>
    <td>GA</td>
  </tr>
  <tr>
    <td>IA</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>ID</td>
    <td>BOISE MER</td>
    <td>08</td>
  </tr>
  <tr>
    <td>IL</td>
    <td>2ND PM</td>
    <td>02</td>
  </tr>
  <tr>
    <td>IL</td>
    <td>3RD PM</td>
    <td>03</td>
  </tr>
  <tr>
    <td>IL</td>
    <td>4TH PM ILLINOIS</td>
    <td>04</td>
  </tr>
  <tr>
    <td>IN</td>
    <td>1ST PM</td>
    <td>01</td>
  </tr>
  <tr>
    <td>IN</td>
    <td>2ND PM</td>
    <td>02</td>
  </tr>
  <tr>
    <td>KS</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>KY</td>
    <td>KENTUCKY</td>
    <td>KY</td>
  </tr>
  <tr>
    <td>LA</td>
    <td>LOUISIANA MER</td>
    <td>18</td>
  </tr>
  <tr>
    <td>LA</td>
    <td>ST. HELENA MER</td>
    <td>24</td>
  </tr>
  <tr>
    <td>MA</td>
    <td>MASSACHUSETS</td>
    <td>MA</td>
  </tr>
  <tr>
    <td>MD</td>
    <td>MARYLAND</td>
    <td>MD</td>
  </tr>
  <tr>
    <td>ME</td>
    <td>MAINE</td>
    <td>ME</td>
  </tr>
  <tr>
    <td>MI</td>
    <td>MICHIGAN MER</td>
    <td>19</td>
  </tr>
  <tr>
    <td>MN</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>MN</td>
    <td>4TH PM MN-WI</td>
    <td>46</td>
  </tr>
  <tr>
    <td>MO</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>CHICKASAW MER</td>
    <td>09</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>CHOCTAW MER</td>
    <td>10</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>HUNTSVILLE MER</td>
    <td>16</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>ST. STEPHENS MER</td>
    <td>25</td>
  </tr>
  <tr>
    <td>MS</td>
    <td>WASHINGTON MER</td>
    <td>32</td>
  </tr>
  <tr>
    <td>MT</td>
    <td>PRIN MER, MT</td>
    <td>20</td>
  </tr>
  <tr>
    <td>NC</td>
    <td>NO CAROLINA</td>
    <td>NC</td>
  </tr>
  <tr>
    <td>ND</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>NE</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>NH</td>
    <td>NEW HAMPSHIRE</td>
    <td>NH</td>
  </tr>
  <tr>
    <td>NJ</td>
    <td>NEW JERSEY</td>
    <td>NJ</td>
  </tr>
  <tr>
    <td>NM</td>
    <td>NEW MEX PM</td>
    <td>23</td>
  </tr>
  <tr>
    <td>NV</td>
    <td>MOUNT DIABLO MER</td>
    <td>21</td>
  </tr>
  <tr>
    <td>NV</td>
    <td>SAN BERNARDINO MER</td>
    <td>27</td>
  </tr>
  <tr>
    <td>NY</td>
    <td>NEW YORK</td>
    <td>NY</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>1ST PM</td>
    <td>01</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>MICHIGAN MER</td>
    <td>19</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO RIVER SURVEY</td>
    <td>35</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>BETWEEN THE MIAMIS</td>
    <td>36</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>MUSKINGUM RIVER BASIN</td>
    <td>37</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO RIVER BASIN</td>
    <td>38</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>1ST SCIOTO RIVER BASE</td>
    <td>39</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>2ND SCIOTO RIVER BASE</td>
    <td>40</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>3RD SCIOTO RIVER BASE</td>
    <td>41</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>TWELVE MILE SQUARE</td>
    <td>43</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>WEST OF GREAT MIAMI</td>
    <td>47</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>US MILITARY SURVEY</td>
    <td>48</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>CT WEST RES-OHIO</td>
    <td>91</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO CO PUR-OHIO</td>
    <td>92</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>VA MILITARY SURVEY-OHIO</td>
    <td>93</td>
  </tr>
  <tr>
    <td>OH</td>
    <td>OHIO</td>
    <td>OH</td>
  </tr>
  <tr>
    <td>OK</td>
    <td>CIMARRON MER</td>
    <td>11</td>
  </tr>
  <tr>
    <td>OK</td>
    <td>INDIAN MER</td>
    <td>17</td>
  </tr>
  <tr>
    <td>OR</td>
    <td>WILLAMETTE MER</td>
    <td>33</td>
  </tr>
  <tr>
    <td>PA</td>
    <td>PENNSYLVANIA</td>
    <td>PA</td>
  </tr>
  <tr>
    <td>RI</td>
    <td>RHODE ISLAND</td>
    <td>RI</td>
  </tr>
  <tr>
    <td>SC</td>
    <td>SO CAROLINA</td>
    <td>SC</td>
  </tr>
  <tr>
    <td>SD</td>
    <td>5TH PM</td>
    <td>05</td>
  </tr>
  <tr>
    <td>SD</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>SD</td>
    <td>BLACK HILLS MER</td>
    <td>07</td>
  </tr>
  <tr>
    <td>TN</td>
    <td>TENNESSEE</td>
    <td>TN</td>
  </tr>
  <tr>
    <td>TX</td>
    <td>TEXAS</td>
    <td>TX</td>
  </tr>
  <tr>
    <td>UT</td>
    <td>SALT LAKE MER</td>
    <td>26</td>
  </tr>
  <tr>
    <td>UT</td>
    <td>UINTAH SPEC MER</td>
    <td>30</td>
  </tr>
  <tr>
    <td>VA</td>
    <td>VIRGINIA</td>
    <td>VA</td>
  </tr>
  <tr>
    <td>VT</td>
    <td>VERMONT</td>
    <td>VT</td>
  </tr>
  <tr>
    <td>WA</td>
    <td>WILLAMETTE MER</td>
    <td>33</td>
  </tr>
  <tr>
    <td>WI</td>
    <td>4TH PM MN-WI</td>
    <td>46</td>
  </tr>
  <tr>
    <td>WV</td>
    <td>WEST VIRGINIA</td>
    <td>WV</td>
  </tr>
  <tr>
    <td>WY</td>
    <td>6TH PM</td>
    <td>06</td>
  </tr>
  <tr>
    <td>WY</td>
    <td>WIND RIVER MER</td>
    <td>34</td>
  </tr>
</table>
