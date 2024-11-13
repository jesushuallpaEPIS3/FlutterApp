import 'package:flutter_application_2/menu/models/comments.dart';

class Place {
  Place({
    this.id,
    this.typePlace,
    this.title,
    this.description,
    this.imageUrl,
    this.likes,
    this.comments,
  });

  final String? id;
  final String? title;
  final String? description;
  final List<String>? imageUrl;
  final int? likes;
  final String? typePlace;
  final List<Comment>? comments;

  static final dumpListData = [
    Place(
      id: '1',
      title: 'Tulum',
      likes: 14,
      typePlace: 'Playa',
      comments: Comment.defaultListComment,
      description:
          'Tulum fue una ciudad amurallada de la cultura maya ubicada en el '
          'Estado de Quintana Roo, en el sureste de México, en la costa'
          ' del mar Caribe.',
    ),
    Place(
      id: '2',
      likes: 29,
      comments: Comment.defaultListComment,
      title: 'Ometepec',
      typePlace: 'Pueblo magico',
      description:
          '''Ometepec (en náhuatl: ome, tepetl, 'dos, cerros''lugar entre dos cerros') es un poblado y cabecera del municipio homónimo en el estado mexicano de Guerrero.''',
    ),
    Place(
      id: '3',
      title: 'Riviera Maya',
      likes: 23,
      typePlace: 'Playa',
      comments: Comment.defaultListComment,
      description:
          'Riviera Maya tiene más de 120 km de costa turquesa cristalina,'
          ' playas de arena blanca, sitios arqueológicos, parques '
          'naturales y actividades acuáticas únicas',
    ),
    Place(
      id: '4',
      title: 'Acapulco',
      typePlace: 'Playa',
      comments: Comment.defaultListComment,
      likes: 39,
      description:
          'Acapulco se encuentra a la altura de los mejores resorts del'
          ' mundo. Representa las vacaciones ideales para cualquier '
          'exigencia',
    ),
  ];
}
