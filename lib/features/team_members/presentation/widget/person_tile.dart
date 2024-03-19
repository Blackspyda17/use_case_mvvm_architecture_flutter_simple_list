import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ingenio_test/features/team_members/data/model/person.dart';

class PersonWidget extends StatelessWidget {
  final PersonModel person;
  final void Function(PersonModel article)? onRemove;

  const PersonWidget({
    Key? key,
    required this.person,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(
          start: 14, end: 14, bottom: 2, top: 2),
      height: MediaQuery.of(context).size.width / 2.2,
      child: Column( children: [ Row(
        children: [
          _buildImage(context),
          _buildNameAndRole(),
          _buildRemovableArea()

        ],
      ),
        _buildBio()]),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: person.avatar ?? '',
        imageBuilder: (context, imageProvider) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
        errorWidget: (context, url, error) => Padding(
              padding: const EdgeInsetsDirectional.only(end: 14),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 3.5,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.08),
                  ),
                  child: const Icon(Icons.error),
                ),
              ),
            ));
  }

  Widget _buildRemovableArea() {
    return GestureDetector(
      onTap: _onRemove,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: Icon(Icons.delete_forever_sharp, color: Colors.red),
      ),
    );
  }

  Widget _buildNameAndRole() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title
            Text(
              '${person.firstName} ${person.lastName}',
              maxLines : 3,
              overflow : TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Role
            Text(
              '${person.title}',
              maxLines : 3,
              overflow : TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBio() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Bio
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  '${person.bio?.substring(0, 100)}...',
                  overflow: TextOverflow.ellipsis,
                  maxLines : 2,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
  void _onRemove() {
    if (onRemove != null) {
      onRemove!(person);
    }
  }


}
