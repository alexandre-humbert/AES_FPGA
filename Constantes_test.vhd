library IEEE;
use IEEE.std_logic_1164.all;


package const_tb is

-- example 1 (input and round 1)
constant INPUT : std_logic_vector(127 downto 0) := x"3243f6a8885a308d313198a2e0370734";
constant CKEY : std_logic_vector(127 downto 0) := x"2b7e151628aed2a6abf7158809cf4f3c";

constant StartRound1 : std_logic_vector(127 downto 0) := x"193de3bea0f4e22b9ac68d2ae9f84808";
constant SubBytes1 :   std_logic_vector(127 downto 0) := x"d42711aee0bf98f1b8b45de51e415230";
constant ShiftRows1 :  std_logic_vector(127 downto 0) := x"d4bf5d30e0b452aeb84111f11e2798e5";
constant MixColumns1 : std_logic_vector(127 downto 0) := x"046681e5e0cb199a48f8d37a2806264c";

constant RESU : std_logic_vector(127 downto 0) := x"3925841D02DC09FBDC118597196A0B32";

-- example vectors

constant round00 : std_logic_vector(127 downto 0) := x"00112233445566778899aabbccddeeff"; -- input
constant round04 : std_logic_vector(127 downto 0) := x"000102030405060708090a0b0c0d0e0f"; -- key

constant round10 : std_logic_vector(127 downto 0) := x"00102030405060708090a0b0c0d0e0f0"; -- start
constant round11 : std_logic_vector(127 downto 0) := x"63cab7040953d051cd60e0e7ba70e18c"; -- s_box
constant round12 : std_logic_vector(127 downto 0) := x"6353e08c0960e104cd70b751bacad0e7"; -- s_row
constant round13 : std_logic_vector(127 downto 0) := x"5f72641557f5bc92f7be3b291db9f91a"; -- s_col
constant round14 : std_logic_vector(127 downto 0) := x"d6aa74fdd2af72fadaa678f1d6ab76fe"; -- k_sch

constant round20 : std_logic_vector(127 downto 0) := x"89d810e8855ace682d1843d8cb128fe4";
constant round21 : std_logic_vector(127 downto 0) := x"a761ca9b97be8b45d8ad1a611fc97369";
constant round22 : std_logic_vector(127 downto 0) := x"a7be1a6997ad739bd8c9ca451f618b61";
constant round23 : std_logic_vector(127 downto 0) := x"ff87968431d86a51645151fa773ad009";
constant round24 : std_logic_vector(127 downto 0) := x"b692cf0b643dbdf1be9bc5006830b3fe";

constant round30 : std_logic_vector(127 downto 0) := x"4915598f55e5d7a0daca94fa1f0a63f7";
constant round31 : std_logic_vector(127 downto 0) := x"3b59cb73fcd90ee05774222dc067fb68";
constant round32 : std_logic_vector(127 downto 0) := x"3bd92268fc74fb735767cbe0c0590e2d";
constant round33 : std_logic_vector(127 downto 0) := x"4c9c1e66f771f0762c3f868e534df256";
constant round34 : std_logic_vector(127 downto 0) := x"b6ff744ed2c2c9bf6c590cbf0469bf41";

constant round40 : std_logic_vector(127 downto 0) := x"fa636a2825b339c940668a3157244d17";
constant round41 : std_logic_vector(127 downto 0) := x"2dfb02343f6d12dd09337ec75b36e3f0";
constant round42 : std_logic_vector(127 downto 0) := x"2d6d7ef03f33e334093602dd5bfb12c7";
constant round43 : std_logic_vector(127 downto 0) := x"6385b79ffc538df997be478e7547d691";
constant round44 : std_logic_vector(127 downto 0) := x"47f7f7bc95353e03f96c32bcfd058dfd";

constant round50 : std_logic_vector(127 downto 0) := x"247240236966b3fa6ed2753288425b6c";
constant round51 : std_logic_vector(127 downto 0) := x"36400926f9336d2d9fb59d23c42c3950";
constant round52 : std_logic_vector(127 downto 0) := x"36339d50f9b539269f2c092dc4406d23";
constant round53 : std_logic_vector(127 downto 0) := x"f4bcd45432e554d075f1d6c51dd03b3c";
constant round54 : std_logic_vector(127 downto 0) := x"3caaa3e8a99f9deb50f3af57adf622aa";

constant round60 : std_logic_vector(127 downto 0) := x"c81677bc9b7ac93b25027992b0261996";
constant round61 : std_logic_vector(127 downto 0) := x"e847f56514dadde23f77b64fe7f7d490";
constant round62 : std_logic_vector(127 downto 0) := x"e8dab6901477d4653ff7f5e2e747dd4f";
constant round63 : std_logic_vector(127 downto 0) := x"9816ee7400f87f556b2c049c8e5ad036";
constant round64 : std_logic_vector(127 downto 0) := x"5e390f7df7a69296a7553dc10aa31f6b";

constant round70 : std_logic_vector(127 downto 0) := x"c62fe109f75eedc3cc79395d84f9cf5d";
constant round71 : std_logic_vector(127 downto 0) := x"b415f8016858552e4bb6124c5f998a4c";
constant round72 : std_logic_vector(127 downto 0) := x"b458124c68b68a014b99f82e5f15554c";
constant round73 : std_logic_vector(127 downto 0) := x"c57e1c159a9bd286f05f4be098c63439";
constant round74 : std_logic_vector(127 downto 0) := x"14f9701ae35fe28c440adf4d4ea9c026";

constant round80 : std_logic_vector(127 downto 0) := x"d1876c0f79c4300ab45594add66ff41f";
constant round81 : std_logic_vector(127 downto 0) := x"3e175076b61c04678dfc2295f6a8bfc0";
constant round82 : std_logic_vector(127 downto 0) := x"3e1c22c0b6fcbf768da85067f6170495";
constant round83 : std_logic_vector(127 downto 0) := x"baa03de7a1f9b56ed5512cba5f414d23";
constant round84 : std_logic_vector(127 downto 0) := x"47438735a41c65b9e016baf4aebf7ad2";

constant round90 : std_logic_vector(127 downto 0) := x"fde3bad205e5d0d73547964ef1fe37f1";
constant round91 : std_logic_vector(127 downto 0) := x"5411f4b56bd9700e96a0902fa1bb9aa1";
constant round92 : std_logic_vector(127 downto 0) := x"54d990a16ba09ab596bbf40ea111702f";
constant round93 : std_logic_vector(127 downto 0) := x"e9f74eec023020f61bf2ccf2353c21c7";
constant round94 : std_logic_vector(127 downto 0) := x"549932d1f08557681093ed9cbe2c974e";

constant round100 : std_logic_vector(127 downto 0) := x"bd6e7c3df2b5779e0b61216e8b10b689";
constant round101 : std_logic_vector(127 downto 0) := x"7a9f102789d5f50b2beffd9f3dca4ea7";
constant round102 : std_logic_vector(127 downto 0) := x"7ad5fda789ef4e272bca100b3d9ff59f";
constant round104 : std_logic_vector(127 downto 0) := x"13111d7fe3944a17f307a78b4d2b30c5";


constant output : std_logic_vector(127 downto 0) := x"69c4e0d86a7b0430d8cdb78070b4c55a";

end package;