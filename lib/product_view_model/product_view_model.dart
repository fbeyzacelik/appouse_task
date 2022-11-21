import 'package:appouse_task/products_model/product_model.dart';
import 'package:appouse_task/services/service.dart';
import 'package:mobx/mobx.dart';

part 'product_view_model.g.dart';

class ProductViewModel=_ProductViewModel with _$ProductViewModel;

abstract class _ProductViewModel with Store{
  ProductService _laptopService;
  ProductService _telephoneService;

  ProductResponse laptopResponse;
  ProductResponse telephoneResponse;


  void init()
  {
    _laptopService=ProductService();
    _telephoneService=ProductService();
  }

  @observable
  bool _loadingStatus=false;

  @computed
  bool get loading=> _loadingStatus;

  @observable
  ObservableList<ProductResult> telephoneList=ObservableList<ProductResult>();
  ObservableList<ProductResult> laptopList=ObservableList<ProductResult>();

  @observable
  ObservableFuture<ProductResponse> telephoneFutureData;
  ObservableFuture<ProductResponse> laptopFutureData;

  @action
  Future getTelephoneData() async {
    _loadingStatus=true;
    try{
      telephoneFutureData=ObservableFuture(_telephoneService.getTelephone());
      telephoneResponse=await telephoneFutureData;
      telephoneList.addAll(telephoneResponse.products);
      _loadingStatus=false;
    }
    catch(e) {}

  }

  @action
  Future getLaptopData() async {
    _loadingStatus=true;
    try{
      laptopFutureData=ObservableFuture(_laptopService.getLaptop());
      laptopResponse=await laptopFutureData;
      laptopList.addAll(laptopResponse.products);
      _loadingStatus=false;
    }
    catch(e) {}

  }

}