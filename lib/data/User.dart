
String userphotoUrl=" ";
String userdisplayName="numan";
String useremail="numanshkair248@gmail.com";
class User {
  String photoUrl=" ";
  String displayName="numan";
  String email="numanshkair248@gmail.com";
  String providerDetails;
  List<ProviderDetails> providerdata;
  // User(this.photoUrl,this.displayName,this.email,this.providerdata,this.providerDetails);
setdata(String photourl,String name,String email,String providerdetail,List<ProviderDetails> providerdata){
  this.photoUrl=photourl;
  this.displayName=name;
  this.email=email;
  this.providerDetails=providerdetail;
  this.providerdata=providerdata;

}
}
class ProviderDetails{
  ProviderDetails(this.providerDetails);
  List providerDetails;
}