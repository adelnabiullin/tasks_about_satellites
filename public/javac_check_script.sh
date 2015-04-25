#! /bin/bash
solution_id=$1
# Check if javac is running
while pgrep "javac" >/dev/null; do
  echo "javac is still running" > /home/adel/rails_projects/tasks_about_satellites/public/uploads/solution/attachment/$solution_id/javac_check.log
done
echo "javac terminated" > /home/adel/rails_projects/tasks_about_satellites/public/uploads/solution/attachment/$solution_id/javac_end.log
rm -f /home/adel/rails_projects/tasks_about_satellites/public/uploads/solution/attachment/$solution_id/javac_check.log