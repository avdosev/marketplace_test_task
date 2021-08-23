import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace/models/catalog_item.dart';
import 'package:marketplace/pages/catalog/catalog_store.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sliverPadding = EdgeInsets.symmetric(horizontal: 24);
    final store = CatalogStore();
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            floating: true,
            expandedHeight: 146.0,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Каталог'),
            ),
            actions: [
              IconButton(onPressed: null, icon: Icon(Icons.search)),
            ],
          ),
          SliverPadding(
            padding: sliverPadding,
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: Image.asset(
                    'assets/images/divan.png',
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
              ]),
            ),
          ),
          SliverPadding(padding: EdgeInsets.only(bottom: 20)),
          SliverPadding(
            padding: sliverPadding,
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 180.0,
                mainAxisExtent: 200,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 15.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) =>
                    _CatalogItem(store.items[index]),
                childCount: store.items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogItem extends StatelessWidget {
  final CatalogItem data;

  const _CatalogItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8, 6, 16, 11),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[350]!, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Image.asset(data.imagePath),
          const SizedBox(height: 6),
          Row(
            children: [
              for (final color in data.colors)
                Padding(
                  child: Bullet(color: color),
                  padding: EdgeInsets.only(right: 4),
                )
            ],
          ),
          const SizedBox(height: 33),
          Text(data.name),
          Text('${data.price} Руб'),
        ],
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  const Bullet({this.height = 9, this.width = 9, this.color});

  @override
  Widget build(BuildContext context) {
    final bulletColor = color ?? Theme.of(context).iconTheme.color;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bulletColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
