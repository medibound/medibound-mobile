import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/records/record_list_item/record_list_item_widget.dart';
import "package:medibound_portal_hdztzw/backend/backend.dart"
    as medibound_portal_hdztzw_backend;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_record_model.dart';
export 'add_record_model.dart';

class AddRecordWidget extends StatefulWidget {
  const AddRecordWidget({
    super.key,
    this.recordCallback,
  });

  final Future Function(medibound_portal_hdztzw_backend.RecordsRecord record)?
      recordCallback;

  @override
  State<AddRecordWidget> createState() => _AddRecordWidgetState();
}

class _AddRecordWidgetState extends State<AddRecordWidget> {
  late AddRecordModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddRecordModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 20.0),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 100.0,
                  child: Divider(
                    thickness: 4.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Select an available record',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  font: GoogleFonts.rubik(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .fontStyle,
                                ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: StreamBuilder<
                              List<
                                  medibound_portal_hdztzw_backend
                                  .RecordsRecord>>(
                            stream: medibound_portal_hdztzw_backend
                                .queryRecordsRecord(
                              queryBuilder: (recordsRecord) =>
                                  recordsRecord.where(
                                'owner',
                                isEqualTo: currentUserReference,
                              ),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: SpinKitPulse(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                  ),
                                );
                              }
                              List<
                                      medibound_portal_hdztzw_backend
                                      .RecordsRecord>
                                  carouselRecordsRecordList = snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: 350.0,
                                child: CarouselSlider.builder(
                                  itemCount: carouselRecordsRecordList.length,
                                  itemBuilder: (context, carouselIndex, _) {
                                    final carouselRecordsRecord =
                                        carouselRecordsRecordList[
                                            carouselIndex];
                                    return StreamBuilder<
                                        List<
                                            medibound_portal_hdztzw_backend
                                            .DatapointsRecord>>(
                                      stream: medibound_portal_hdztzw_backend
                                          .queryDatapointsRecord(
                                        parent: carouselRecordsRecord.reference,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 25.0,
                                              height: 25.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 25.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<
                                                medibound_portal_hdztzw_backend
                                                .DatapointsRecord>
                                            containerDatapointsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: RecordListItemWidget(
                                            key: Key(
                                                'Keydkn_${carouselIndex}_of_${carouselRecordsRecordList.length}'),
                                            recordWidth:
                                                MediaQuery.sizeOf(context)
                                                    .width,
                                            record: carouselRecordsRecord,
                                            data: containerDatapointsRecordList
                                                .map((e) => e.data)
                                                .toList(),
                                            selected: true,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  carouselController:
                                      _model.carouselController ??=
                                          CarouselSliderController(),
                                  options: CarouselOptions(
                                    initialPage: max(
                                        0,
                                        min(
                                            1,
                                            carouselRecordsRecordList.length -
                                                1)),
                                    viewportFraction: 0.5,
                                    disableCenter: false,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3,
                                    enableInfiniteScroll: false,
                                    scrollDirection: Axis.vertical,
                                    autoPlay: false,
                                    onPageChanged: (index, _) =>
                                        _model.carouselCurrentIndex = index,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ].divide(SizedBox(height: 10.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
