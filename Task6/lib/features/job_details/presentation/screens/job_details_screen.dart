import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:job_app/core/contants.dart';

import '../../../../core/widgets/custom_text.dart';
import '../../../job/data/models/jobs_model.dart';
import '../widgets/job_details_app_bar.dart';
import '../widgets/job_details_border_container.dart';

class JobDetailsScreen extends StatelessWidget {
  final Data data;
  String formatDescription(String html) {
    html = html.replaceAll(
      '<p><strong>',
      '<p class="section-title"><strong>',
    );

    html = html.replaceAll(
      '<h2>',
      '<h2 class="section-title">',
    );
    html = html.replaceAll(
      '<h3>',
      '<h3 class="section-title">',
    );

    return html;
  }
  const JobDetailsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JobDetailsAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //job card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(borderRadius10),
                  border: Border.all(color: borderColor, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //icon
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius10),
                        border: Border.all(color: borderColor, width: 1),
                        color: backGroundIconColor,
                      ),
                      child: Icon(
                        Icons.engineering_outlined,
                        size: iconSize30,
                        color: darkBlueColor,
                      ),
                    ),

                    SizedBox(height: 20),

                    //company name
                    CustomText(
                      title: data.companyName,
                      color: darkBlueColor,
                      fontSize: fontSize18,
                      fontWeight: fontWeightBold,
                    ),

                    SizedBox(height: 3),

                    //job title
                    CustomText(
                      title: data.title,
                      color: appBarIconColor,
                      fontSize: fontSize20,
                      fontWeight: fontWeightBold,
                    ),

                    SizedBox(height: 15),

                    //icon location, text location
                    Row(
                      children: [
                        //icon location
                        Icon(
                          Icons.location_on_outlined,
                          size: iconSize20,
                          color: greyAppBarColor,
                        ),
                        SizedBox(width: 5),
                        //text location
                        CustomText(
                          title: data.location,
                          color: greyAppBarColor,
                          fontSize: fontSize15,
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    //icon clock, text 2 days ago
                    Row(
                      children: [
                        //icon clock
                        Icon(
                          Icons.access_time_outlined,
                          size: iconSize18,
                          color: lightBlueColor,
                          fontWeight: fontWeightBold,
                        ),
                        SizedBox(width: 5),
                        //text 2 days ago
                        CustomText(
                          title: data.postedAgo,
                          color: lightBlueColor,
                          fontSize: fontSize15,
                          fontWeight: fontWeightBold,
                        ),
                      ],
                    ),

                    SizedBox(height: 15),

                    //remote, tags, job types
                    Wrap(
                      alignment: WrapAlignment.start,
                      runSpacing: 10,
                      spacing: 8,
                      children: [
                        //remote,
                        JobDetailsBorderContainer(
                          text: data.isRemoteString,
                          isRemote: true,
                        ),
                        //tags
                        ...data.tags!.map(
                          (tag) => JobDetailsBorderContainer(text: tag),
                        ),

                        //job types
                        ...data.jobTypes!.map(
                          (jobType) => JobDetailsBorderContainer(text: jobType),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              //description
              Html(
                data: formatDescription(data.description),
                style: {
                  "body": Style(
                    fontSize: FontSize(fontSize16),
                  ),

                  ".section-title": Style(
                    fontSize: FontSize(fontSize20),
                    padding: HtmlPaddings.only(bottom: 10),
                    margin: Margins.only(bottom: 10),
                    border: Border(
                      bottom: BorderSide(
                        color: borderColor,
                        width: 1,
                      ),
                    ),
                  ),

                  "strong": Style(
                    fontWeight: FontWeight.bold,
                  ),
                  "img": Style(
                    width: Width(300),
                    height: Height(200),
                  ),
                  "ul": Style(

                    padding: HtmlPaddings.only(left: 20, top: 10, bottom: 10),
                    margin: Margins.only(bottom: 15),
                  ),

                  "li": Style(
                    fontSize: FontSize(fontSize18),
                    color: greyAppBarColor,
                    //margin: Margins.only(bottom: 8),
                    padding: HtmlPaddings.only(left: 5),
                  ),

                  "div": Style(
                    fontSize: FontSize(fontSize18),
                    color: greyAppBarColor,
                    //margin: Margins.only(bottom: 8),
                    padding: HtmlPaddings.only(left: 5),
                  ),


                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
