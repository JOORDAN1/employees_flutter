import 'package:employees/Items/list_Button.dart';
import 'package:employees/Items/menu_button.dart';
import 'package:employees/jobs/add_job_screen.dart';
import 'package:employees/jobs/edit_job_screen.dart';
import 'package:employees/jobs/jobs_api_handler.dart';
import 'package:employees/jobs/jobs_info_screen.dart';
import 'package:employees/models/job.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsScreen extends StatefulWidget{

  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState()
  {
    return _JobsScreenState();
  }



}

class _JobsScreenState extends State<JobsScreen> {

  final JobsApiHandler apiHandler = JobsApiHandler();
  List<Job> data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    final result = await apiHandler.getJobsData();
    setState(() {
      data = result;
      isLoading = false;
    });
  }

  void deleteJob(int id) async{
    await apiHandler.deleteJob(id: id);

    getData();
  }

  @override
  Widget build(context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => JobsInfoScreen(
                          job: data[index],
                          appBarText: "${data[index].Name}",
                        ),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        data[index].Name,
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        data[index].Description,
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: Colors.orange,
                            tooltip: 'Edit',
                            onPressed: () async {
                              await Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => EditJobScreen(job: data[index], appBarText: "Edit task."))
                              );
                              getData();
                              print('Edit ${data[index].Name}');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.red,
                            tooltip: 'Delete',
                            onPressed: () {
                              deleteJob(data[index].Id);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListButton(
              buttonText: "Add Job",
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => AddJobScreen())
                );
                getData();
                print('Add new job');
              },
            ),
          ],
        )

      ],
    );
  }
}