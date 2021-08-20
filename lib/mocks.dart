import 'package:places/domain/geo_point.dart';
import 'package:places/domain/sight_description.dart';

import 'domain/sight.dart';
import 'domain/sights_filter.dart';

final mockGeoPoint = GeoPoint(lat: 55.7557988, long: 37.5750142);

final mockSights = <Sight>[
  Sight(
    name: 'Эйфелева башня',
    details: 'Металлическая башня в центре Парижа, самая'
        ' узнаваемая его  достопримечательность',
    geoPoint: const GeoPoint(lat: 48.51, long: 2.17),
    url: 'https://slon.fr/wp-content/uploads/2020/06'
        '/Eiffel_Tower__night_photo_057981_-1280x853.jpg',
    category: SightCategory.special,
    workHours: 'закрыто до 09:00',
  ),
  Sight(
    name: 'Статуя свободы',
    details: 'Колоссальная скульптура в cтиле Наполеона III,'
        '  или стиле Второй империи, расположенная в США на острове Свободы',
    geoPoint: const GeoPoint(lat: 40.41, long: -74.02),
    url: 'https://prousa.info/images/cities/statue_of_liberty'
        '/statue_of_liberty.webp',
    category: SightCategory.special,
    workHours: 'закрыто до 12:00',
  ),
  Sight(
    name: 'Государственный музеей изобразительных искусств имени А. С. Пушкина',
    details: 'Московский музей зарубежного искусства, основанный  '
        'профессором Московского университета Иваном Цветаевым в 1912 году',
    geoPoint: const GeoPoint(lat: 55.44, long: 37.37),
    url: 'https://upload.wikimedia.org/wikipedia/commons'
        '/0/06/The_State_Tretyakov_Gallery.jpg',
    category: SightCategory.museum,
    workHours: 'закрыто до 11:00',
  ),
];

final mockVisitedSights = <VisitedSight>[
  VisitedSight(
    name: 'Государственный музеей изобразительных искусств имени А. С. Пушкина',
    details: 'Московский музей зарубежного искусства, основанный  '
        'профессором Московского университета Иваном Цветаевым в 1912 году',
    geoPoint: const GeoPoint(lat: 55.44, long: 37.37),
    url: 'https://upload.wikimedia.org/wikipedia/commons'
        '/0/06/The_State_Tretyakov_Gallery.jpg',
    category: SightCategory.museum,
    workHours: 'закрыто до 11:00',
    visited: 'Цель достигнута 12 окт. 2020',
  ),
  VisitedSight(
    name: 'Статуя свободы',
    details: 'Колоссальная скульптура в cтиле Наполеона III,'
        '  или стиле Второй империи, расположенная в США на острове Свободы',
    geoPoint: const GeoPoint(lat: 40.41, long: 74.02),
    url: 'https://prousa.info/images/cities/statue_of_liberty'
        '/statue_of_liberty.webp',
    category: SightCategory.special,
    workHours: 'закрыто до 12:00',
    visited: 'Цель достигнута 5 апреля. 2021',
  ),
];

final mockWishVisitSights = <WishVisitSight>[
  WishVisitSight(
    name: 'Эйфелева башня',
    details: 'Металлическая башня в центре Парижа, самая'
        ' узнаваемая его  достопримечательность',
    geoPoint: const GeoPoint(lat: 48.51, long: 2.17),
    url: 'https://slon.fr/wp-content/uploads/2020/06'
        '/Eiffel_Tower__night_photo_057981_-1280x853.jpg',
    category: SightCategory.special,
    workHours: 'закрыто до 09:00',
    visit: 'Запланировано на 12 окт. 2022',
  ),
  WishVisitSight(
    name: 'Государственный музеей изобразительных искусств имени А. С. Пушкина',
    details: 'Московский музей зарубежного искусства, основанный  '
        'профессором Московского университета Иваном Цветаевым в 1912 году',
    geoPoint: const GeoPoint(lat: 55.44, long: 37.37),
    url: 'https://upload.wikimedia.org/wikipedia/commons'
        '/0/06/The_State_Tretyakov_Gallery.jpg',
    category: SightCategory.museum,
    workHours: 'закрыто до 11:00',
    visit: 'Запланировано на 5 авг. 2021',
  ),
];

final mockDescription = SightDescription(
  name: 'Пряности и радости',
  description: 'Пряный вкус радостной жизни вместе с шеф-поваром '
      'Изо Дзандзава, благодаря которой у гостей ресторана есть возможность '
      'выбирать из двух направлений: европейского и восточного',
  type: 'ресторан',
  workHours: 'закрыто до 09:00',
  url: 'https://picsum.photos/id/3/400/600',
);
