class Products{
  int ?id;
  String ?title;
  int ? price;
  String ? thumbnail;
Products({
  this.id,
  this.title,
  this.price,
  this.thumbnail,
});  
Products.fromJson(Map <String,dynamic> json){
  id= json['id'];
  price = json['price'];
  title = json['title'];
  thumbnail = json['thumbnail'];
}
Map<String,dynamic> toJson(){
  final Map<String,dynamic> data = <String,dynamic>{};
  data['id']=id;
  data['price']= price;
  data['thumbnail']= thumbnail;
  data['title']= title;
  return data;

}

}